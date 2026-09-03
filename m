Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CC64E2369
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 15:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449819; cv=none; b=Otw5It/GirAinqoXgchIRFdy3JPdyFMIGyCWzvsjmwbG0MqbYguhTrXpEyLNEg87LfYffkPl5QNeFUmGUWiWLg6fFUSfDmbuCco1YFDdzPwwsWb/2zbb+BhgoLqWAHmiD+4aqsupsiLowtsnuowBG0kvmgQL7Pb+KmWGwP8aoik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449819; c=relaxed/simple;
	bh=ocBgaR/p4mDc95EBHb/KEM0O7kuD3J+8uI2l8jWDVnk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TDJSD+2pdpih+HMJVhpN+mDa54MKYVsHeuMC2eOYR8vjyEajSEDPkKpq2a/+ZAI6slnbv3uWMjOzedxTB+wWR8yj9dHi/OELErqKiT8YoPm/792sZTFkgBUYllF7klthcDSTGnR+rWF8qvIoOC54AZzRkDMOLz6knY0LyIzhgeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ebfite6p; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ebfite6p"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-499c930cb9cso23475e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449815; x=1789054615; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=twZrxZ5m5jBOiPqNd4DyLEyatwFqOt/iSKjel+SkYfo=;
        b=Ebfite6pgJlzOJutuRCOAoj77Ik/p5i05nOirSlRPdUTzL2pRoWxy3JmQqu16QaBh6
         a+Ox4YjDvuGBxyGF07Bc4qyojtDJsXmCj4/9+ncXXpVJ8tr03ENgUdmN+gCRG8NpTmMO
         l7zO3HDVi+YX/toYjnxzQtHi8l/KCJRnXFBpMNTv3po+8+9s/u/nkrseMltFucEDOOIy
         uPEgAAiYlQnG/3LuboNncdGx9aIRFceAC8bEdkGQgPeFAN5XQ/Ixwo1qXaqz6CYUpFOV
         8BTKYRcy+ystRQBwsPCh8l+dka9+rwtJZvtpcYcWLZLEnWFBHeSoHILyt5JddgenLHWC
         WQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449815; x=1789054615;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twZrxZ5m5jBOiPqNd4DyLEyatwFqOt/iSKjel+SkYfo=;
        b=eoaiE7jTPu8RJITMt8PN8l1n4G6k+uajaZANwEoadr43KLahisPPveB0cTajWWC6Ih
         daF0zgR3t7GETIX64SgJgfJI4Fpxe9nnpPaXIwKNq/7hv7ujBc7Se55zxMONuOH7t5hn
         J6/xRJNzQAfyB2GJysMdEEiKRGCohykiudo4sSwYhcCiAUmYfclxGu8rkRF8FRdyRMqX
         TdalvpDScOgvkRWnwuiIk/qJfUfuAd/yo7d/Ixitu5jG6dyqiUEhEJepJzwzvzP9TVkp
         eFo4hNQrnyzfH+LCW4o0vT0UfpjppnS2LhOogR66tws+zsXRX3fLq7v1n7odmlVjPWLq
         uaxg==
X-Gm-Message-State: AFuF++nj1+X6+z/ysEiyOKfQEPBl4yW83dUE95mw8XI5juOf7MIHBZSH
	u+8sYE/TMCan9vNqikuM/lRrTQosqLSbWHo6huC2fiVnx0j4wpsfFMDarFqfQ6Z/
X-Gm-Gg: AYBFou0WyFbffaqY3TBQipQ8+m0LSCv1WAcXvUDW5XLfR7DIRFw8vU/P8uL8PM1Q5XP
	VYNr1Mc6IRI2b4hJc3aeDbi11YxtWiJ09b6i7UYFhFf1mx0w5wdl8Drorvt9B7Z8hmarfJQicM6
	NFBu4t1J0NwoJKG1rl3yHf0r2CNDvCbQfULPVu/5t8DWW8lyROzA5dpSwF8hLYM7/YHWigPY/WR
	U6jK8mjoutoCLH6alW8RXN/XleI8GsvJ+z9qCiZVQSMKG4tycL8mQ4oC97oT18GAmLU+yRocHOP
	9KL9z8Vh5y/OCxTJIzVZ+G7Olvh2BoIkIU+CCpmHFxa979UHgYmrtt9s/3Omiw/l8Xc7vTwIyTI
	3J7KBIRkjNEGBkovTXCxbJf81gda2GpTzaBWStEoF2a6as/Ma3wfetDcI4XQtY5J4K4x4mdFH15
	uti6E9gSxCkREa9q5zAnXZYz7Suu9hgkuQ03FtmlTstKTcFgKHFWG+MxWMkYb94XeORloYBNDTE
	GdoIKA72lXtd2A04ezBiLHxAV4FCp47bCftsG1kdfYgRcHne6U6fo83xqMKFwdUu9ic22dcffKc
	yd2tJWWKHxYdh3jWMuHITKYqczQ=
X-Received: by 2002:a05:600c:4e8f:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49ce57f5647mr199325655e9.1.1788449815170;
        Thu, 03 Sep 2026 08:36:55 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm84653935e9.14.2026.09.03.08.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 17:36:54 +0200
Message-Id: <DL5SJQEFQ56S.26JAOHTQ8JXPY@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v1 03/10] bpf: Reject tail calls directly from
 callback frames
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260903144433.1716731-1-memxor@gmail.com>
 <20260903144433.1716731-4-memxor@gmail.com>
 <20260903152147.C0E241F00A3A@smtp.kernel.org>
In-Reply-To: <20260903152147.C0E241F00A3A@smtp.kernel.org>

On Thu Sep 3, 2026 at 5:21 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The patch prevents bpf_tail_call within a callback to fix the 'c=
allback unexpected regs' verifier bug, but misses that BPF_LD_ABS and BPF_L=
D_IND trigger the exact same bug via the same prepare_func_exit() path.
> --
>
> commit a25ccc5cdb72d9330414949c17ecac5156595510
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
>     bpf: Reject tail calls directly from callback frames
>
>     A tail call from a non-zero frame is modeled as a return from that fr=
ame,
>     synthesizing R0 and calling prepare_func_exit() for the taken branch.
>     When the current frame is a synchronous callback, prepare_func_exit()
>     enforces the callback return-value contract and marks R0 precise, tri=
ggering
>     the "callback unexpected regs" verifier warning during precision back=
tracking.
>     This patch rejects a tail call made directly by a callback before
>     constructing the inconsistent return state.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 7d8ddb1bee00c..f540279ff4abb 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -11228,6 +11228,17 @@ static int check_helper_call(struct bpf_verifie=
r_env *env, struct bpf_insn *insn
>>  		if (env->cur_state->curframe) {
>>  			struct bpf_verifier_state *branch;
>>
>> +			/*
>> +			 * A taken tail call is modeled as a return from the current
>> +			 * frame. A callback frame cannot be left that way because
>> +			 * prepare_func_exit() would apply its return contract to the
>> +			 * unknown R0 synthesized below. Stack-depth validation rejects
>> +			 * this construct anyway.
>> +			 */
>> +			if (cur_func(env)->in_callback_fn) {
>> +				verbose(env, "cannot tail call within callback\n");
>> +				return -EINVAL;
>> +			}
>
> [Severity: High]
> This isn't a bug introduced by this patch, but doesn't BPF_LD_ABS inside =
a
> subprog trigger the exact same bug via the same prepare_func_exit() path?
>
> Looking at check_ld_abs() in kernel/bpf/verifier.c:
>
>     if (env->cur_state->curframe) {
>         struct bpf_verifier_state *branch;
>
>         mark_reg_scratched(env, BPF_REG_0);
>         branch =3D push_stack(env, env->insn_idx + 1, env->insn_idx, fals=
e);
>         if (IS_ERR(branch))
>             return PTR_ERR(branch);
>         mark_reg_known_zero(env, regs, BPF_REG_0);
>         err =3D prepare_func_exit(env, &env->insn_idx);
>         if (err)
>             return err;
>         env->insn_idx--;
>     }
>
> If a CAP_BPF user loads a SCHED_CLS program (where BPF_LD_ABS is allowed)=
,
> invokes bpf_loop(), passes PTR_TO_CTX through the stack to the callback_c=
tx
> argument, loads the context into R6 inside the callback, and executes
> BPF_LD_ABS, it appears check_ld_abs() will synthesize R0 and call
> prepare_func_exit().
>
> Since the callback frame lacks instruction history for R0, won't precisio=
n
> backtracking fail and hit the exact same "callback unexpected regs" verif=
ier
> warning? Does check_ld_abs() need a similar rejection for callbacks?
>

Has to be fixed separately.

>>  			mark_reg_scratched(env, BPF_REG_0);
>>  			branch =3D push_stack(env, env->insn_idx + 1, env->insn_idx, false);
>>  			if (IS_ERR(branch))

