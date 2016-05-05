package hello;


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebAppConfiguration
public class GreetingTests {

    @Autowired
    private WebApplicationContext webContext;

    private MockMvc mockMvc;

    @Before
    public void setMockMvc(){
        mockMvc = MockMvcBuilders
                .webAppContextSetup(webContext)
                .build();
    }

    @Test
    /**
     * ensure configuration defined in ReadingListApplication is well formed
     */
    public void greetingEndpoint() throws Exception {
        mockMvc.perform(get("/greeting"))
                .andExpect(status().isOk());
    }

    @Test
    public void greetingWithNameParamEndpoint() throws Exception {
        mockMvc.perform(get("/greeting?name=bob"))
                .andExpect(status().isOk());
    }

}
