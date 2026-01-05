describe Shape {
    it 'Makes basic shapes' {
        "$(shape polygon 50% 50% 0% 100% 100% 100%)" |
            Should -Be 'polygon(50% 50%, 0% 100%, 100% 100%)'           
    }
    context 'Basic Shapes' {
        it 'Can make circles' {
            "$(Shape Circle 50%)" |
                Should -Be 'circle(50%)'
            "$(Circle 50%)" |
                Should -Be 'circle(50%)'
            "$(CSS.CIRCLE 50%)" |
                Should -Be 'circle(50%)'
        }
        it 'Can make ellipses' {
            "$(Shape ellipse 25% 50%)" |
                Should -Be 'ellipse(25% 50%)'
            "$(CSS.ELLIPSE 25% 50%)" |
                Should -Be 'ellipse(25% 50%)'
            "$(ellipse 4rem 50% at right center)" |
                Should -Be 'ellipse(4rem 50% at right center)'            
        }

        it 'Can make paths' {
            "$(shape path m 0 0 h 100 v 100 h -100 v -100)" |
                Should -Be "path('m 0 0 h 100 v 100 h -100 v -100')"
            "$(path2d m 0 0 h 100 v 100 h -100 v -100)" |
                Should -Be "path('m 0 0 h 100 v 100 h -100 v -100')"
            "$(css.path2d m 0 0 h 100 v 100 h -100 v -100)" |
                Should -Be "path('m 0 0 h 100 v 100 h -100 v -100')"
            "$(css.path m 0 0 h 100 v 100 h -100 v -100)" |
                Should -Be "path('m 0 0 h 100 v 100 h -100 v -100')"
        }
        
        it 'Can make polygons' {
            "$(shape polygon 50% 50% 0% 100% 100% 100%)" |
                Should -Be 'polygon(50% 50%, 0% 100%, 100% 100%)'
            "$(POLYGON 50% 50% 0% 100% 100% 100%)" |
                Should -Be 'polygon(50% 50%, 0% 100%, 100% 100%)'
            "$(css.POLYGON 50% 50% 0% 100% 100% 100%)" |
                Should -Be 'polygon(50% 50%, 0% 100%, 100% 100%)'
        }        

        it 'Can make shapes' {
            "$(shape nonzero from 0 0 line to 10px 10px)" |
                Should -Be 'shape(nonzero from 0 0, line to 10px 10px)'

            "$(Shape 'nonzero from 0 0' 'line to 10px 10px')" |
                Should -Be 'shape(nonzero from 0 0, line to 10px 10px)'
            
            "$(CSS.SHAPE 'nonzero from 0 0' 'line to 10px 10px')" |
                Should -Be 'shape(nonzero from 0 0, line to 10px 10px)'
            
            "$(css.SHAPE 'nonzero from 0 0' 'line to 10px 10px')" |
                Should -Be 'shape(nonzero from 0 0, line to 10px 10px)'
        }

        it 'Can make insets' {
            "$(shape inset 10% 20% 30% 40%)" |
                Should -Be 'inset(10% 20% 30% 40%)'
            "$(inset 10% 20% 30% 40%)" |
                Should -Be 'inset(10% 20% 30% 40%)'
        }

        it 'Can make a xywh relative shape' {
            "$(shape xywh 10% 20% 30% 40%)" |
                Should -Be 'xywh(10% 20% 30% 40%)'
            "$(xywh 10% 20% 30% 40%)" |
                Should -Be 'xywh(10% 20% 30% 40%)'
        }
        
        it 'Can make rectangles' {
            "$(shape Rect 0 1% auto 3% round 0 1px)" |
                Should -Be 'rect(0 1% auto 3% round 0 1px)'
            "$(rect 0 1% auto 3% round 0 1px)" |
                Should -Be 'rect(0 1% auto 3% round 0 1px)'
            "$(CSS.Rect 0 1% auto 3% round 0 1px)" |
                Should -Be 'rect(0 1% auto 3% round 0 1px)'
        }                                    
    }
}
