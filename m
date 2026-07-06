Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0728F3AC0D8
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352583; cv=none; b=sdBsWzRCK4xkj5K9fNo344KCr6kjaFGXfaSuyB2lAehAgdG7rNCvTTs7h8MIRUbgm50tv1yYVCsP0rDfaxVf2rrTrWLkFtfoBvvtC3GPRWm6yOmd0bJtFvDxwlEW/+qj7r+ql3lN5A5blYf1PG7eElmW9B0LTnhNpx5V+sV1yiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352583; c=relaxed/simple;
	bh=q0XhXu+Jj2Eg7U1xn2xyi7qY1cKp8f2BE3mlRnhVMfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhHUFdh9DtRztzWEEZ7dzyUScDU79sAAPRAePuRovbdANSQZ8b5tSg0XqQR1pgwxCvtPMMgByiGCzQIk6QQ3H9PgwUmCnvNag5IQkDr3c3F+2ICvHL6Y5P8L+LCKRmYOqVEyDMccLEY0zCFjT2T5e9TaWJ4MtKEx9xeS3fKCepI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4aSxFqE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4aSxFqE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47122683cf3so2064291f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783352580; x=1783957380; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+74TScEtXC8EWHN2LGNuN8gZZcygL9VaFHqI167VTSU=;
        b=H4aSxFqExw0UDhgnIfxpOk3P3pQ8u0tkVhvGYrQVKfu/sr8nvu7zcGAF81oNt5JW2g
         1YGsiGkimy5HfBjjLXRxAM8VCNvjovApF69oo0fketQMN7HELbIi6vXUNXX/4L1XfucG
         ZQptaWCtJfrwbE09dDNb5WdRTpcWrDqIrTR1qqr7e474sXhoodF44t71yon/+nm0rf9s
         IFNx9tH86oJgsFW0SAS/Z0YszAz7YQHy4VsIh+DliGfPtOVTq+93/wqWwStPa4YD/5+S
         lOst223NtvHweQdRTKOwUUUuBmv4Im3Z7zopTIIvDZvwuKvIJMu0UiGW6S6yQ8ASRvs2
         l3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352580; x=1783957380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+74TScEtXC8EWHN2LGNuN8gZZcygL9VaFHqI167VTSU=;
        b=RnXfDIeFxR1EVsxetnzoq14Q/OLiN3ZpUYLVdcH8ZfvYiBqdYdCw7OIXgVNN43197k
         3NtL83U6SZKaSpzKeesTb81jljHmB5gqVDHRjMWIRnyq50FjwFdwqHS0fSadCQeRybH0
         q7eJlN0d5pQOqExjlwjH6O1IXIibWbGWGujCvHs+1/DKu6P4OXSojdmoAFx4UHfaw33g
         1j2Sz0iQXruBzfPCM1slb7OqsddksRJWdYKjw9FuGcvw5BK2TgNVc7nh6NpqU048L21v
         SvLGZymmbIMl4QXg4LrOsbRVLlC8vnVDde9kaLSnQxGnRjqtfrBFkIck5ExXgpeg2M1B
         McSQ==
X-Gm-Message-State: AOJu0YwDDKygR3/FIibOWnRNRTB7fGrKthojm3jRSY4m0pWXEs5jtp9y
	tHwmg0Pz9IzbYpoR+hoT4/M4Ph2sEDtRha7PD1nozbTXoUUqh0GKIt2qLPmJZROxlI5HaQ==
X-Gm-Gg: AfdE7clMhKzO+wEibDPKfv68CU3+ClR2y9Z4UQL+zrK3O7KhOnlaUaW1aRkMDz3iiio
	h+e62L2XIjQZXeu/FeTlHcbj6I03PN5ROSrFhW+Em0SE2Is3JzJ+vEFEnAxokiH9BA+KskaIiFs
	+PQDSD5jnPO1gZpdHAzXE17tB/X5QZQridwBAeVWfc41OTbzFMOaCJJop2LT5YUwfhHr7zSvyBe
	8mwiNc1emktfck/5nuQyU2GSyUz4IjfH8frQRg47qNtXhfU7ja98mLv+A4tgKm9F/Iy1f0Ji2q+
	Iio66ao8QYqs3Cb1fb3B3t+HM59CF4/G34d0DO04kA7s+iSraAOgZ6XQwQGsFCTfRve/KDpZL3J
	uH0IilUWjjXFrG/2h7vjj2ryqreS0o/S6XcOOhttp35Hajax2T/V348NFyOyx+nEQUis15g9W3l
	GfJR+muebzvG0DtRXAu7izYVo9xufDOPjmn1ilrJ9Ub2WO
X-Received: by 2002:a05:6000:461e:b0:47d:df96:c9f4 with SMTP id ffacd0b85a97d-47de6667871mr1068251f8f.10.1783352580139;
        Mon, 06 Jul 2026 08:43:00 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm26893633f8f.0.2026.07.06.08.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:42:59 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:42:57 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/6] bpf: Add ksock kfuncs
Message-ID: <akvNAV2PmZNJPR0x@gmail.com>
References: <20260706093525.13030-1-mahe.tardy@gmail.com>
 <20260706093525.13030-3-mahe.tardy@gmail.com>
 <20260706100142.6233C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706100142.6233C1F000E9@smtp.kernel.org>

On Mon, Jul 06, 2026 at 10:01:41AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing rollback of pernet subsystem on initialization error paths in `bpf_ksock_kfunc_init`.
> --
> 
> commit c26355c87f06c9eb5cc9cceccb20cfce50aa1e1e
> Author: Mahe Tardy <mahe.tardy@gmail.com>
> 
> bpf: Add ksock kfuncs
> 
> This commit introduces BPF kfuncs to allow BPF LSM and SYSCALL programs to
> create and use sockets for sending data. It adds several lifecycle and usage
> kfuncs for kernel sockets, limits socket creation via a per-namespace sysctl,
> and registers the necessary BTF kfuncs.
> 
> > diff --git a/net/core/bpf_ksock.c b/net/core/bpf_ksock.c
> > new file mode 100644
> > index 0000000000000..8bde734bc917d
> > --- /dev/null
> > +++ b/net/core/bpf_ksock.c
> 
> [ ... ]
> 
> > +static int __init bpf_ksock_kfunc_init(void)
> > +{
> > +	int ret;
> > +	const struct btf_id_dtor_kfunc bpf_ksock_dtors[] = {
> > +		{
> > +			.btf_id = bpf_ksock_dtor_ids[0],
> > +			.kfunc_btf_id = bpf_ksock_dtor_ids[1],
> > +		},
> > +	};
> > +
> > +	ret = register_pernet_subsys(&bpf_ksock_net_ops);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL,
> > +					&ksock_init_kfunc_set);
> > +	if (ret) {
> > +		unregister_pernet_subsys(&bpf_ksock_net_ops);
> > +		return ret;
> > +	}
> > +
> > +	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL,
> > +					&ksock_kfunc_set);
> > +	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_LSM,
> > +					       &ksock_kfunc_set);
> > +	return ret = ret ?: register_btf_id_dtor_kfuncs(bpf_ksock_dtors,
> > +						 ARRAY_SIZE(bpf_ksock_dtors),
> > +						 THIS_MODULE);
> 
> [Severity: Medium]
> If the later register_btf_kfunc_id_set() or register_btf_id_dtor_kfuncs()
> calls fail in bpf_ksock_kfunc_init(), does this leak the pernet operations
> registration?
> 
> The earlier error path for BPF_PROG_TYPE_SYSCALL registration properly
> calls unregister_pernet_subsys(&bpf_ksock_net_ops). If these subsequent
> registrations fail, the function returns the error directly without cleaning
> up the pernet subsystem.

Since there's no way of unregistering kfuncs for a certain prog type if
one step fails, I took the decision to unregister the per net ns count
if the first fails. Not sure how important this is and if there's a
cleaner way of doing this?

The last return line could be adjusted as mentioned in a separate thread
on the same message.

> 
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260706093525.13030-1-mahe.tardy@gmail.com?part=2
