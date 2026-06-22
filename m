Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF8437B014
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 22:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782166248; cv=pass; b=QRFq4ekrnkChQotakCw+mSKjtiKEOG0EGLHax/Ac7MAyJKqA3kHowTv+fBdzYxydey7khsPl6zj7mL+Ge9AdyibMH2cVb78wKJYdkfBpZnCNcXibLrTF4g02V2kfSCTGup5lPfJXEbn6gI4sXFna0LvXWrCJaefVQWnVfHMnGUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782166248; c=relaxed/simple;
	bh=QqrWApQo7VCDxjiHXQ3hjKNrBnjqHPx3tgxEKUSRHZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWSDyCBYUTTDKXE6LufNEnw5E8yU+Qh93iKMFFe65Pp8+2sXu6Sabehpm5JNeDM9Q4LRzgUI3g77dpnc0+nuEovmdYkouDJwgcyI2hzeweByreRlW0JZMRX8shgwWb5V11tAOQdQRkHxmIWKaU6Ho5thqCpfKdbxn6OrmjH1b0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uPLDKDCp; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uPLDKDCp"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-662b95934dcso5145581d50.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 15:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782166246; cv=none;
        d=google.com; s=arc-20240605;
        b=OOo0A3DjrxAD/A+aW/HKmqzsjCSKmKI52sO0hu+D7kIJBecDuHV+itSDLlJishlHL9
         ve7b5lyh4uYaPN4LgJdB3Rog1CJywWJAbwitwHH37tLCpS9pG6uFnKD9Vg5VUJUA2yoX
         zD+FhVJiKhKQF8zk/NGNtszmI2xIlu3xUWKJ/D10xhb8K/CrwjOdsEfxaECCbahX6z5h
         5xn4xv6m7qFpwwSHhlmdwez6MQ6mRdn5ZtpWdrf13PfPxnKzpFXfKMIcm8nW+EUKmVTb
         aAXt8ofw8NJz6wdSAnXrmqxXt6RdT+g6diIz9IRytA3WVb91Z6jEPbOSz/8mA+hUch9m
         uY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QqrWApQo7VCDxjiHXQ3hjKNrBnjqHPx3tgxEKUSRHZs=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=ArG8vJrkDABWEu2zcqzPMcx556sni71fKb0PHBdKsMkcjRpK1e01LhTPP4S5Vo2Lqd
         4ohC8haj1/46Xlht/lZycYhS2odSher7suKDwG8YCaNo4QN4X7jywcPkVgTf2Xn6tceV
         taZ0ILRQB0FtGYLLERyq9myk/0GFahIVuflUDQ1kkLp8nKvBXP/hfoXZTydcl9owCCJQ
         tHSbA0wdZoCGA8C/djbQbWwmwCSiWQcsxXWZ+TAHGFqUIbm06AEbnobt6mX2VrmthAvm
         sua07STVMpFuXMUM1aQoxl216UsVjKFdDNCvYSKn7JYUiHsNJifxK2ieoueoxC/TVYuO
         e6YA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782166246; x=1782771046; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QqrWApQo7VCDxjiHXQ3hjKNrBnjqHPx3tgxEKUSRHZs=;
        b=uPLDKDCprxq1HQHfRHa0JhirNKyc9y9bP8IsisjvtzejTY6ll4rZPIP9NFe/XOmYuI
         F1tCq+aNFtbPMKOqwkGBPGrUpnWoSvNav0Cb5LS8xaj51mz3IZWWfV8bXZ1tJu7UOwGf
         RttyQftFEApuOMq4cJw6Dlcztrb37OO4M59hdJeOdz0X1DTijcHasLXFKkufryWxRBTg
         sOF4Af7u9tOgOGAsa1Ee/A/OkogaFwv8RYe1HJP1B3SGEnhXyyqWo6iqEnJ96NzBs8F7
         YzxCFOPKW0E2ZqWxU8GgQ35o8maJC5hphJoVt2W6EyiEsXtHWpt793p9GH6S+EDTwGIv
         YIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782166246; x=1782771046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqrWApQo7VCDxjiHXQ3hjKNrBnjqHPx3tgxEKUSRHZs=;
        b=tYLbAm0U6ojGx/5mL3CnDowGZd9Q8ZVGxhvSHde6EGrGFCwIQsbebQyz08cfyPYESO
         RrTgVFt2pBeF32FZaX90VuQYpIRs+eDGtnE6bVZ+60CqqXBWETurzwhW35jJjZCabmAb
         YPqfvr5G1g56MqWjUUsbR5LIFMFnf28pLRcLTueUCMkKvJTFNb0q7Sky1yxTPOFxBVXk
         af50tBz+dJmZzMB9GCxkk4NY9PRBW9qUXHDYVBW98+5kwW++cIi1hrQw6EIvcedzVBgC
         2qXCbEzZdc/oa/XJkn37W9TmP1uC4nuGggOmUhfIrebs9dhw/bdkuTdjbrnE2VtM2tXM
         92VQ==
X-Gm-Message-State: AOJu0YxLeXcBkyOU9JlUaMKmScFSU4MNpSMdswqAvbe+cQMt5wf+4A/b
	wjA7q+5eTwMzphZgetclw/7A3omxNzw/FAvs156hFz3hUROEBNMMHNf1/livNxjRO9MRtWbSeBp
	0oPBBrDrNSJdYsKR6/RG7y0fejO7thTXhgISXOQwJndjDy6nxgxKIMC6CYJuhCA==
X-Gm-Gg: AfdE7clyUtRlikBkSUoPwwccT3hhxRH7rE4T8P1AeEmb87fvzgOSCZkzghQotbnS0/6
	zvk95tp53MfKFNdYHE+r54nnRmytU3Qpu8jzNbUe3Z8knCuuAVz3PSZhBWtWirBudiaaVSkm4Jt
	UqLAp4BbRhfE9TcGzsrigPagxIdp4IZ2I6DlvkAIkZcsYYsIbsRwGkUJTnMJQFMoM7qOJt50KBX
	lozJChb/nfMIis2i4R6QpfqQzpzUglqNqQ52ZNwxaMll0QVwCEwfdgWdDbdUoUCybzEu+As5vlU
	txC8CS6i
X-Received: by 2002:a05:690e:190b:b0:660:4369:8cb1 with SMTP id
 956f58d0204a3-66359ebca4emr351633d50.24.1782166245989; Mon, 22 Jun 2026
 15:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622-bpf-lskel-fixes-v1-1-7c09a1585ba4@google.com> <20260622211734.EC3831F000E9@smtp.kernel.org>
In-Reply-To: <20260622211734.EC3831F000E9@smtp.kernel.org>
From: Sid Nayyar <sidnayyar@google.com>
Date: Mon, 22 Jun 2026 23:10:34 +0100
X-Gm-Features: AVVi8CfOEhcUrrhYZvwlyH5EtaTPbHavELWd43PARr_UqLG6dqs-v5jbd-vm4_E
Message-ID: <CA+OvW8atZ63+=Rgsoaaufj3DUEsPKGUJ9gYURVkNa9UReyuxZg@mail.gmail.com>
Subject: Re: [PATCH] libbpf: fix weak kfunc name suffix resolution for light skeletons
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> By resolving weak kfuncs to their essential names instead of their suffixed
> names here in RELO_EXTERN_CALL and RELO_EXTERN_LD64 above, does this break
> backward compatibility fallbacks in light skeletons?
>
> If a BPF program uses bpf_ksym_exists() to fall back to an older prototype
> (e.g., calling func___v1 which takes 1 argument) but the kernel provides a
> newer prototype without the suffix (taking 2 arguments), this would resolve
> successfully because prototype validation against the suffix is bypassed.
>
> Would the BPF verifier then accept a program calling the kfunc with only
> R1 set, causing the kernel to execute the function with uninitialized or
> garbage data in R2? Alternatively, if the verifier rejects the incompatible
> register state, wouldn't this entirely break the intended backward
> compatibility logic?

Self-NACK. Please ignore this patch. Bypassing prototype validation
and unconditionally resolving to the essential name completely breaks
the fundamental logic of backward and forward compatibility in BPF
programs using light skeletons. This patch should be discarded.

Regards,
Siddharth Nayyar
