Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20393659EB
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243654; cv=none; b=h2cX0ieteodECt+FnzL/Lcc7PX7ho0Tsw2HTY/7uWr7tSmqRlzEVWCMkXo+kkB/CW9J82rcWbLeNFIsJHFCmAUpoP+X47gdVDe9jcaQNOjiZxNcZ0GoGp+i9Cy7rmQnTEoSturfK2TQ1j7MbOsA02F5tj4cSnbAyPpoSk6heL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243654; c=relaxed/simple;
	bh=tpUUoLIM2aOLsxab7fNWMAQM6jLls8itSrAR07dXwoc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lYILFYfv6Qp7dUIBDmzsAWVn99fLmI1otgBAYtHbkz9OQCQsZwHm+stIUseix4GBdQymqK6HhcQBIShoM0YnTWB/L2lDCQqDVQdEQZNLcz+jVxvxlsQXqP21DAyExvXE+JjswriwKzC1dUVF5Gu7phshmQhXv4a7NQyGpNmzU5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPyFqkFj; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPyFqkFj"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d715f4a587so7079745ad.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788243652; x=1788848452; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8xO2I2T/Ef2MvjHky4J+U6USqxNuR9jyMN845Mg68AY=;
        b=JPyFqkFjI69N6kM9UyhACQ4gynbnnmTcQI7JkZiTC8v9YZQ8oLTZTutkQJ+/VKyiFP
         GdttlPd36FSzk9dohS9IWl5geBnuxZDxWxIpUaG3rQTRNr1meA//qsp0NsWNP97SodZJ
         IuJea2/PPFXs5K5ah7ELrcZWokrYa/JsCzIQWtmixsL+PWA6oPBTL5YWojnNQKJKTgBf
         7wg5AaegwppuFzzUwmhoSbuQ4Ngu552hseGxKHa2MzxjsPoGDmYefUK2jNMXYrZKfBKq
         +fwBI/Pfw/Emy+ajOOMI+nQaHy26zY8Vd1x849LxDG/rsz9nHEH2vRzj6BYKKUPZTcRP
         fIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788243652; x=1788848452;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xO2I2T/Ef2MvjHky4J+U6USqxNuR9jyMN845Mg68AY=;
        b=GXT0mvrq9BIvtwK4ZZxNAfna1o/oZakvgfIyfo91k4B/dWnZ0Br3ZYmiZ1UmlWMCi0
         +QbDqFq7XDYGTeNlq7Vfi27pbXmFIfsa4MIAj2ivag+D6ZXTnQ+lkXRW9ZmB3zIb0s0Q
         8TqlcX1iemca2jS+bSmye/UQ/JxxWChfH2L3LYmr/8aQ1wvjotQSj/M5Fm/u7/vkGg7H
         hVItHY+RY89hQ/de2nbZNACQxS+E4MkkIilrREqDZoBEZJFD1PzIFy/gof6qyaQ9XCZT
         DvJBU15KPQ8TZN3S/4UITinTyiKvKh+QmxBjEFJJ6E8vGn3svvX+iAynJxbQRy0rxOGr
         puWg==
X-Gm-Message-State: AFuF++mYtUpOE1yfM4EQ/nG+wjMyJIT9iSZOJaGQ8yqF5vTTUj4I2iIf
	3AZi8M5dzgM3iq4m05Fytf+C2JBTandBD86GGoeLCfvRItJn9S7eU0oeS+qqCeU4
X-Gm-Gg: AYBFou1t/+WFD4VU5+bw2l8n7IOQJHrKsgTtPHFQc95Tb8KbLuCwC7ae4w1cIA/setv
	RmBjx+4WyXNrPAV5UWswaSXxoZGBO6uDCgauSQPG2XPYlSJtoR6a416KcvBBu8zcTUoL48gETB2
	Pu0+esfzHROuEd/QIhBCErw8xtUm4bFhZ+W/UjHvZeTWNzyTE4Ty6yWqmmMlGxPwlVgHnLPrV9x
	6Cm/UTXeadc5vs+9q7e0oks29dlL5U0BShL4JC++WtwM6Wt6INLH22XSMF+PVp5vQ3/Xj/+bt/P
	slxHPuSgMYWb6FTYHhGgCaIUlZXLIrdLQ9I3OEwqIKzT8rWOWQbSyFwbYtme5Yewx6SkKBYyBdj
	IZ438JuOP7BDmtpouwnqN1zljAtoZ5YiHSxQ4sbEMIncG4FqA98IGCszpvPlierSHrjQzQPoPMp
	yZFUpu2WpBAulqVVr4wnMO5lDqIaBW50azaFsNWU0vr7yFrzbdTzmQ3bBOPy4ckJ0cJFjZJezF3
	At2UFEcX3QNgiLy
X-Received: by 2002:a17:903:8d0:b0:2d7:4cd4:5a7f with SMTP id d9443c01a7336-2d74def6351mr536747175ad.12.1788243651842;
        Mon, 31 Aug 2026 23:20:51 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598b0455sm46798205ad.69.2026.08.31.23.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:20:51 -0700 (PDT)
Message-ID: <836e4262927db41e736a461c45cd74c106525d1c.camel@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: backtracking shouldn't clear outer frame
 R1-R5 for callbacks
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Mon, 31 Aug 2026 23:20:48 -0700
In-Reply-To: <20260901020211.6F4871F000E9@smtp.kernel.org>
References: 
	<20260831-bug-015-backtrack-cb-args-precise-v1-1-68a8e2a821e0@gmail.com>
	 <20260901020211.6F4871F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-09-01 at 02:02 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Flawed heuristic for distinguishing subprog exits from callback =
exits causes the verifier to erroneously reject safe programs that call a s=
ubprog immediately before a looping callback.
> --
>=20
> commit 09e9430ffafbb3bf72d2c301a4d20da098050142
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: backtracking shouldn't clear outer frame R1-R5 for callbacks
>=20
> This commit fixes precision propagation for R1 during a second iteration =
of
> bpf_loop(). It removes the logic in backtrack_insn() that previously clea=
red
> R1-R5 when backtracking through a callback's BPF_EXIT, ensuring precision
> marks are not incorrectly reset.
>=20
> > diff --git a/kernel/bpf/backtrack.c b/kernel/bpf/backtrack.c
> > index a2b18a9f1694c..4fe9065106739 100644
> > --- a/kernel/bpf/backtrack.c
> > +++ b/kernel/bpf/backtrack.c
> > @@ -520,37 +520,34 @@ static int backtrack_insn(struct bpf_verifier_env=
 *env, int idx, int subseq_idx,
> [ ... ]
> > =C2=A0		} else if (opcode =3D=3D BPF_EXIT) {
> > -			bool r0_precise;
> > +			bool from_subprog_call, r0_precise;
> > +
> > +			/* BPF_EXIT in subprog or callback always returns
> > +			 * right after the call instruction, so by checking
> > +			 * whether the instruction at subseq_idx-1 is subprog
> > +			 * call or not we can distinguish actual exit from
> > +			 * *subprog* from exit from *callback*. In the former
> > +			 * case, we need to propagate r0 precision, if
> > +			 * necessary. In the former we never do that.
> > +			 */
> > +			from_subprog_call =3D subseq_idx - 1 >=3D 0 &&
> > +					=C2=A0=C2=A0=C2=A0 bpf_pseudo_call(&env->prog->insnsi[subseq_idx =
- 1]);
>=20
> [Severity: High]
> Can this heuristic misclassify a callback exit as a subprog exit?
>=20
> If a program calls a subprog immediately followed by an iterating callbac=
k
> helper (like bpf_loop()), and we backtrack from the callback's BPF_EXIT,
> subseq_idx equals the index of bpf_loop(). Checking subseq_idx - 1 evalua=
tes
> the instruction before bpf_loop(), which happens to be the subprog call.
>=20
> This makes from_subprog_call incorrectly evaluate to true for the callbac=
k.

But that can't really happen. If the code looks like this:

  foo(...);
  bpf_loop(...);

There should be r1-r4 setup for bpf_loop() call, because foo()
invalidates those.

> > +
> > +			r0_precise =3D from_subprog_call && bt_is_reg_set(bt, BPF_REG_0);
> > =C2=A0
> > =C2=A0			/* Backtracking to a nested function call, 'idx' is a part of
> > =C2=A0			 * the inner frame 'subseq_idx' is a part of the outer frame.
> > =C2=A0			 * In case of a regular function call, instructions giving
> > =C2=A0			 * precision to registers R1-R5 should have been found already=
.
> > -			 * In case of a callback, it is ok to have R1-R5 marked for
> > -			 * backtracking, as these registers are set by the function
> > -			 * invoking callback.
> > +			 * In case of a callback from bpf_loop(), R{1,4} in the calling
> > +			 * frame would be set as precise and that is correct.
> > =C2=A0			 */
> > -			if (subseq_idx >=3D 0 && bpf_calls_callback(env, subseq_idx))
> > -				for (i =3D BPF_REG_1; i <=3D BPF_REG_5; i++)
> > -					bt_clear_reg(bt, i);
> > -			if (bt_reg_mask(bt) & BPF_REGMASK_ARGS) {
> > +			if (from_subprog_call && (bt_reg_mask(bt) & BPF_REGMASK_ARGS)) {
> > =C2=A0				verifier_bug(env, "backtracking exit unexpected regs %x",
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 bt_reg_mask(bt));
> > =C2=A0				return -EFAULT;
> > =C2=A0			}
>=20
> [Severity: High]
> Will this incorrectly trigger the verifier bug check for callbacks?
>=20
> Because bpf_loop() requests R1 precision (which falls under BPF_REGMASK_A=
RGS),
> the misclassified from_subprog_call causes this safety check to evaluate =
to
> true. Could this prematurely abort verification with -EFAULT and falsely =
reject
> perfectly safe BPF programs?

See above.
