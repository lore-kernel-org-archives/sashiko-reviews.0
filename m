Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79533B0595
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571569; cv=none; b=KSimFxLTcb+9VFAPIc3QasuTP7y/7C32E29j/8paMTDxEN60bpOSpkFEcc8awPBo/vEHDhSuYanUDLJ7rWb0GHKV2HpltWGOfV8uynwfKiB1jYND25lbY/26kGpsQrzCBz1VIU9xqm+FpTNvHkY9HNE/6M3Zz2TXpiy/O5OLOzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571569; c=relaxed/simple;
	bh=wZod1qP4w1aqsDdgDezPpakELxIm8vqk6zVUSsSiTGM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fp7Fd0Xm1KxlwrwlEPPZg+8sF+Pk0V2RxvIvQJj5ByQeGMoI46+TFGlE8xzZSYBaJOzlnV0aefktdthmBmT4XZVmHFOKYDeFqaRjZfvkuN+HDfu3lPjro72fm5SWmXXWeU4PDRYG5mw+7suQFlMhbwLKlLqfNAvZQFVOWOLmPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWcKNHKO; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWcKNHKO"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso9208895eec.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571567; x=1792176367; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RdnMVkZ01fdHhx2FatP4rLX8DB7tZD+RKSIs68YHMRI=;
        b=EWcKNHKONYs38QUwotGHu+axM4HQTb+bgqT/3A0yMqhwONqATJ0X+ucb877vKGYpnV
         t2s0pI3TrPtjmhfqK4iXnT25hcFuSrA/lQMIunZCZB4TIwx86XK7MOINQIdm/+hCfgXc
         9WsuYuoGxfb55c4zgUovhtXb5ydPxDdR2F4YE6kgQ+7RFYDDsWXIvBDlM/L9qUPvQYHq
         sdiPSewtVoYu61Xt10urMYrOychbNxVsHx/X/nPbmMvEDk1sCw/O5aLQ9ViNe2wpkFwy
         5RUm1Yy+rmdBfCM7c/clyBv11tIcWtdRh1HhGarI63vhpvT5Dl4wvP5wHkPUgCJ565no
         tPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571567; x=1792176367;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdnMVkZ01fdHhx2FatP4rLX8DB7tZD+RKSIs68YHMRI=;
        b=W1IwItV025omNzisDIS96VAF7AyeS1BOD7YHS2QaoF842fOiraWVWXk/hH9man4mSJ
         pdvWT5JN4zsGSV6xMA/P3rFeEylA4E99qVtEoMT4PYwObCNA8JZaKQkjtDPIyY+dRY3Q
         HtWSsdLSmogC22y+vKmh7yqVWMSKRdE995+RMex97DC4rVGqvz3HrjzqbGGUGHv+Z5jR
         /Whjj7E8/eWliUpe5q736xFhv+EzW1UfbdwJqtvu37H/t5SDNx7BNuLwxBLLrfBnbysl
         AsXw6nAErujEqmdG4MhAF4KzYyZAPt/G2yS4B2JV5UBKCs0LvaZH4LQm1jzwww8slH4x
         dxoQ==
X-Gm-Message-State: AFuF++laECwCBs4Dl0dO1uG54X82KZoohgbrk6sFlmFXRiTCgcg1fi43
	DKMdrGPxdZjmU8zEvyMmCJa2dfQXYCdpAOLtfU40Ldv3oqBhvvArFiA938BxeZSs
X-Gm-Gg: AYBFou2VhbZM3ETF+i91RSDp2bDD0+IE8X3t9qUWSL3dXgkznXmmIvxw6nhkfj5ieRf
	ZHF+nrYgZBMlje7xaHogyG4Qo8LjnlRHlvwdM23TsnNJLh4B/+l9vVPuB5Nsl0BNEQffQF5KNok
	Ir0hfGvNhfoHmvM/EUh0yBRuZtHecADKROGziM5s+rFoEyaBuoic7Vx5YGEl+7RQLrbSy+ozkDc
	uw4vjJmkf9iCX99gHfTCpAHLA3jT5r0YepFIVEtoZWFsBQggv+1EhF1xBPcXUDKImMkio51F0Na
	lTS5wMlckamBnm74p09u4iEV5FLJfV21dWZhtZWOK3v7FzCvY71GbzBkh2d7vXbW9hMZat3h9J8
	J6YOGHpXtBnpNINTZpm5h7HqXH2RYA/KI+NYx9qJpaN34mwoqtq41OZLEDPFTTr75Jg6VtD2Fa8
	2HOuS+fjP6E5aIR63iYIbvtctoexDnUaAZQcHV/Nt39R7YmsoSuEQCdfNcdJFO90vI7r2Vc4r7y
	Gfxvjf6ao7i2Wlxy1QpX0Dm4rt2vjnNb5k+RpvvSipICWJF5nHLR3p6
X-Received: by 2002:a05:7300:f3c5:b0:351:7c99:c239 with SMTP id 5a478bee46e88-3537ddd42f9mr3791541eec.5.1791571566660;
        Fri, 09 Oct 2026 11:46:06 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:26fd:a5f6:5f7e:c6b7? ([2620:10d:c090:500::4:66bf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm8437400eec.27.2026.10.09.11.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:46:06 -0700 (PDT)
Message-ID: <147015d9dd64f4dc1bcb01b59c027f34a41cadf2.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 11/51] bpf: compute parameters liveness in
 bpf_compute_live_registers()
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Fri, 09 Oct 2026 11:46:05 -0700
In-Reply-To: <sashiko-outbox-165368@kernel.org>
References: <20261009-scev-minimal-rebase-v3-0-bcba9bc53ac9@gmail.com>
	 <20261009-scev-minimal-rebase-v3-11-bcba9bc53ac9@gmail.com>
	 <sashiko-outbox-165368@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-10-09 at 11:26 +0000, sashiko-bot@kernel.org wrote:

...

> > @@ -10939,6 +10940,15 @@ static int btf_check_func_arg_match(struct bpf=
_verifier_env *env, int subprog, s
> >  	meta.fn =3D fn;
> >  	meta.func_proto =3D func_proto;
> > =20
> > +	/*
> > +	 * Check if all register arguments declared in BTF are initialized.
> > +	 * If they aren't the BTF is unreliable.
> > +	 */
> > +	if (!bpf_subprog_is_global(env, subprog)) {
> > +		for (i =3D 0; i < min_t(u32, sub->arg_slot_cnt, MAX_BPF_FUNC_REG_ARG=
S); i++)
> > +			if (caller->regs[BPF_REG_1 + i].type =3D=3D NOT_INIT)
> > +				return -EINVAL;
> > +	}
> >  	return check_func_args(env, &meta, env->insn_idx);
> >  }
>=20
> [Severity: High]
> Because unused arguments are no longer marked as live due to the change
> in compute_insn_live_regs(), can this NOT_INIT check be completely
> bypassed by regsafe()?
>=20
> If the verifier first explores a path where the argument is initialized,
> the subprogram is not marked unreliable. If it subsequently explores
> another path where the argument is left NOT_INIT, this second path
> will be pruned before evaluating the BPF_CALL instruction and hitting
> btf_check_func_arg_match().
>=20
> Could this result in the subprogram remaining "reliable", allowing
> fentry/freplace extension programs to attach to it and potentially
> leak uninitialized kernel memory via the BTF context?

This is a valid point.
I should OR live[subprog_entry].in with BTF type mask.
