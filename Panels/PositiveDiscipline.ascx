<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PositiveDiscipline.ascx.cs" Inherits="Admissions.Panels.PositiveDiscipline" %>
<asp:Panel runat="server" ID="DisciplinePanel" >
<div class="formArea">

<asp:Literal runat="server" ID="disciplineLiteral">
<p>It is the policy of the department of Early Childhood Education at Sullivan University that a student participating in any externship use only positive guidance techniques when working with young children. Positive guidance as defined by the Childcare program at Sullivan is: An ongoing process of directing children's behavior that allows the child to develop self-discipline gradually and results in learning pro-social skills. It is based on the concept that children who are engrossed in meaningful activities which they find rewarding and interesting, are much less likely to misbehave. </p>


<p>A student would be dismissed from the Early Childhood Education Program for using corporal punishment (spanking, hitting, shaking, striking, pinching, biting, swatting, or slapping hands) when working with any child. A student may not use harsh language, yell or use intimidation in any manner when working with a child. The student should only use the word "no" in limited situations, when the use of other guidance techniques has failed. ****Safety of the child is paramount. If at anytime the student feels the child is in immediate or emergent danger, the student may physically remove the child from the situation. Example: A child steps off the sidewalk into the street during a walk or an environmental hazard is present.**** </p>


<p>In accordance with the child's age, cognitive, social and emotional developmental stage, the following guidance techniques are approved for use by the Sullivan University Early Childhood Education Program.</p>

<p>Redirection - This technique works well with toddlers and very young preschoolers. Distraction from the misbehavior, substitution of an acceptable activity and humor are all forms of redirection. Redirection should not be used routinely with older children who need practice in handling social situations.</p>


<p>Reinforcement - This technique uses effective praise, a form of encouragement that focuses on children's activities rather than on the teacher's evaluation of their work. Rather than, "you have painted a beautiful picture", "you have worked very hard on that picture, can you tell me about it?"</p>


<p>Cuing - A technique used to help children remember what is expected by giving them a specific signal.</p>


<p>Ignoring the behavior - When the behavior can be safely ignored, this is a good technique to extinguish unwanted, annoying and attention-seeking behavior. However it is important to note that anytime attention is withdrawn through ignoring, it is important that attention be given at other times in a positive way.</p>


<p>Discussion - When age appropriate, talking about their problem behavior with children will often resolve the behavior.</p>


<p>Problem Solving - The long range goal of all guidance techniques is that children learn constructive ways of solving problems. Using a problem solving technique with the whole group or individual child, the teacher creates a "no-lose" situation. It is based on a mutual respect, between teacher and child. </p>


<p>Unconditional Attention - Conveying acceptance to children by letting them know they are valued and liked; attention that is not predicated by a response to a specific behavior.</p>


<p>Prevention - This technique is used when the teacher steps in when noting a potential problem situation before the problem actually occurs. Clearly defined rules and expectations for a child are a form of prevention.</p>


<p>Modeling - A technique used by the teacher/student to model the expected behavior for the child by their actions and words.</p>


<p>Active Listening - A technique to help clarify communication between the teacher and the child. Active listening involves reflecting back to children what they have said as a way to help them find their own solutions to problems.</p>


<p>Logical consequences - This technique allows the child to experience the natural outcome of their action. Examples of appropriate logical consequences are: A child throws the ball over the fence, the ball is gone and she can no longer play with the ball. If a child continually disobeys the rule to stay on the sidewalk during an outing, he must stay indoors with a teacher during the next outing.</p>


<p>Behavior Management/Positive Reinforcement - Based on the principle that children will continue to display behaviors for which they get acknowledgment or attention. Students should use positive reinforcement to reward expected behavior. Examples: The child who hangs his coat in his cubby, the child who waits patiently for his turn with a book, the child who displays good manners. Focus should be on the child's observable actions and activities. Positive re-enforcers can include: smiles, touches, words of praise, or extra attention.</p>


<p>I have read and understand the preceding guidelines for positive guidance of young children espoused by Sullivan University's Early Childhood Education Program. I agree to comply by them throughout Externships I, II, III, IV and V.</p>

</asp:Literal>

<asp:Label runat="server" ID="lblDisciplineInitials" AssociatedControlID="disciplineInitials">Student Initials:</asp:Label>
<asp:TextBox runat="server" ID="disciplineInitials" ></asp:TextBox>
<asp:RequiredFieldValidator runat="server" ErrorMessage="Please enter your initials" ControlToValidate="disciplineInitials" ForeColor="#CC0000"></asp:RequiredFieldValidator>
<br />

<asp:Label runat="server" ID="lblDisciplineDate" AssociatedControlID="disciplineDate">Date:</asp:Label>
<asp:TextBox runat="server" ID="disciplineDate" ></asp:TextBox>
<asp:RequiredFieldValidator runat="server" ErrorMessage="Please enter the date" ControlToValidate="disciplineDate" ForeColor="#CC0000"></asp:RequiredFieldValidator>
<br />

</div>
</asp:Panel>