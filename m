Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C6B33F8C1
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 07:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779952212; cv=pass; b=jeTeGngloUylIoqcxhrHT+mkH6EJiylWf/+oEioEoUMN6SbEYEKouOYbCiBfvv4Jlp+6A08BB8M53ujMQDiY8NzBtGsR+FyXizp1aB5Wr9sh58Ff5P+QAk9qgnkzX+spXqwarxZslyTebGVPmb040cKHms7cNZ8pMrI6wpUoN6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779952212; c=relaxed/simple;
	bh=qb0+MrmCF7DVBeJVMnkF+COBZ4mo98rk7ENOXbazzec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfPaC3uYHbqgUFNTALB23IhdtH+ZdLv0upxsox27HjOFV4tyercdWKzXjlH1sxUPKcJNZtQsCSaQuanH0b9vSA7+LiLM2uIfUq2sh2Symb03oOll+fwHq8VM6DeLSSasK1WcCLr9MritM1f075HyN6cm6URoGsWySio+EhEDJ3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VooFHglE; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VooFHglE"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8bb09239328so94753256d6.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 00:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779952210; cv=none;
        d=google.com; s=arc-20240605;
        b=ExjJGPfVRpa1FpZbESBBbRSYxsG57ixlBhEv7j7QtBYMKw1pucwSNq/81NACTXl3Y9
         dfLuRa5mNja7aaib9ektlAuIBWnkZXIvVfAEeRxXRXzUHeofWUsm7xsodfdJJzeClhsN
         PkdfAaAynnITklwal4VtNA1P+nn2Xp7TMKLHL2jvABoRIn21w3JMn08xoOnLNUil0ytJ
         MbWnRKVg+pTz3uKknksSgMbyc45ABLWR+x3e+RRkoJXFVOZAjzqgjAaXFxxQa3ryA6mI
         sIeoa9G+eTgIsyxlN2lH6VDI5ABLAORSNYCXcVUvLuVX1eBsxHabuVcaKYibqlodscbZ
         xRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aoUYOMPrMmAsyTOdHWz12f2+LnWGrx2lB+tf8/EVVcg=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=lktSoHw2R8807069EDGaCA6I/eza1oOYgO6m/cONNBKXCLUxbEpTUZ4qZN3Vw5E1bk
         2OsXLLwOJgXh+TTRTpwgcSGpL3zNnk9uTrEx0sV2OgTaU/zPIkgqMvPsoHBCYerX7K6F
         DL8MIWrPtgTZlI9aeqwjq6Sacvxssu9R620dVgfBbXnr2kfDS0xLnnobcPFLDoLiORrl
         Ys4Ghw/6ShDoXYA3XlVNV9zgjAkb6mVS8Cye8qepDozOoZSVhkR28T6MKnYGaVMcAQen
         UNI6YzTBAvefhW1H6Gx6oJjziz3iw0Sa39zkjTUgsnQgT7tWECptbK/UNzIrLNg3goWX
         w95A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779952210; x=1780557010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoUYOMPrMmAsyTOdHWz12f2+LnWGrx2lB+tf8/EVVcg=;
        b=VooFHglEZHUODxIg2xTlwmY7raH2DHSBJSVosFbuE7w1lEWZYhosIgZcSTaFq6motD
         hYHGFX99kFyDJCswMj3Un0UpTen7I16Z4bH9Z3LQ9G54IZVKaEk34xrCeit8iD4AJOCO
         ZQEgyMgMBMWmmUj4/s3mosvaaVOqL3wI4dw1SVKJSHCMo4YaxcK4DBXJQFj9reSgpL0H
         o3qNZu2Zm7SGX7VJ8y+EAmIA7+aTVBjw5CQnX0/oaNfmPaRzuuMkplZE4apt2snKOGCQ
         mkzsSgFTLoncTZB/7Oav3lv41jZC4s5VmtEIpf3fpUYqhvwbYL6VgwcR+I2toKnt59bC
         bdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779952210; x=1780557010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aoUYOMPrMmAsyTOdHWz12f2+LnWGrx2lB+tf8/EVVcg=;
        b=ieqjVUKp5GhugBbKhvRMLLP5iTcXXvQ9EWBkhMZBrY2q8ZrHCn8qNclLPfCEmsl/qk
         +Zpl9oMfgb/fbdgt0nqtaUPP24T+0sS8IxNil77XHzkgw9FekSoMEC0+aaaaBAczH0ew
         RaR+kIteSpwHZtz4LZRWN7tUUY6DJTSXzsHMJzCT6RFGoVsUCwO03ZzSUh9wnQwlaQ6j
         qCK5BktatKn0iaDPEtEvsC612/jBnJGxBdNedEZ8h2UMpIkSBKTLhSWfKocwVdCZojYq
         CYwFPh7oaK2dy6yuS7HoCEO/9o1bOX2P0WgU7br8l6VdUNxA9Ukteu9+sn7+kp6UA/De
         FXYg==
X-Gm-Message-State: AOJu0YwtL6a06pVQxPum5kBbWDuHfFCNKwTrzrqGb1jeA6g0BZX5vuhF
	iEd4ns1/kS59XpVgPmm1DMPHnfDWhptgHTMTg8FAHCx8s3mWX7nM+eb7XmRbdCzCDCio8ZDu1hL
	R3T0xh5SJIx1ktaVRuNHZzSdlzqYEbRp6iQLUJvc=
X-Gm-Gg: Acq92OGrmtFwUsEZ/ou6ZbA8TyM4nW5K8BbPU8Y/ZZEi5CGT+/eobkECzxSjFXojfcC
	4XkxPYIsd8HWcaDeS6fNAqQqfnR0ocqTE7U+55s3stir5/ikkOS/4Bk51wi1kHAiHBq6EsDd7hU
	ahxF0HMiGclrxBHbNGnFno/8qr3DMbJ9vuC3BcM5lNuSO2PKNWyf9EWFHlMzPDrYcou2FZersRD
	TDFM81slTMxzZQwxRTAVdU72i+Jw8f5rrbGNYbnl8cvnVEQG1LhMaXZGgqQoBAWN9qWf4fyVWwe
	hYTGaGZdinQw56IxlDqmrGNIoUIvc5w75xyk4awYof80p6LB
X-Received: by 2002:a05:6214:2e48:b0:8ca:1cee:7c4b with SMTP id
 6a1803df08f44-8cc7b67e09cmr449902556d6.39.1779952210399; Thu, 28 May 2026
 00:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528032234.1322565-2-ewandevelop@gmail.com> <20260528034244.DC8041F000E9@smtp.kernel.org>
In-Reply-To: <20260528034244.DC8041F000E9@smtp.kernel.org>
From: Ewan Hai <ewandevelop@gmail.com>
Date: Thu, 28 May 2026 15:09:58 +0800
X-Gm-Features: AVHnY4JtvNNQuQK0gvq8q01WbU5goPZysAGYoyRmic0X0pah3tanl9wIKzGWgnk
Message-ID: <CAG2uPc4E4mW9Rvxb7PdzRByd9teW0KcJaKHB=ZBHQWLa_6iiJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] KVM: x86: Expose Zhaoxin SM2 CPUID feature
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

good catch, I'll fold that into v3.

On Thu, May 28, 2026 at 11:42=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch modifies `arch/x86/include/asm/cpufeatures.h` without s=
yncing the changes to the tooling copy at `tools/arch/x86/include/asm/cpufe=
atures.h`.
> --
>
> commit 17e8fbfd326bc812ee6f132253d520b0c7201874
> Author: Ewan Hai <ewandevelop@gmail.com>
>
> KVM: x86: Expose Zhaoxin SM2 CPUID feature
>
> This commit advertises the Zhaoxin SM2 algorithm and SM2_EN features to K=
VM
> guests via CPUID 0xC0000001 EDX bits 0 and 1. It updates the CPU features
> header and the KVM CPU caps initialization.
>
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/=
cpufeatures.h
> > index 1d506e5d6f46a..20b33413189c2 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -136,6 +136,8 @@
> >  #define X86_FEATURE_HYPERVISOR               ( 4*32+31) /* "hypervisor=
" Running on a hypervisor */
> >
> >  /* VIA/Cyrix/Centaur-defined CPU features, CPUID level 0xC0000001, wor=
d 5 */
> > +#define X86_FEATURE_SM2                      ( 5*32+ 0) /* "sm2" SM2 a=
lgorithm */
> > +#define X86_FEATURE_SM2_EN           ( 5*32+ 1) /* "sm2_en" SM2 enable=
d */
>
> [Severity: Low]
> Since arch/x86/include/asm/cpufeatures.h is modified here, should this pa=
tch
> also update the tooling copy at tools/arch/x86/include/asm/cpufeatures.h?
>
> Without syncing the tooling header, tools/perf/check-headers.sh will emit=
 a
> warning during the perf tools build process indicating that the kernel AB=
I
> header differs from the tooling version.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528032234.13=
22565-1-ewandevelop@gmail.com?part=3D1
