Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE4D30B53A
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 08:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560036; cv=none; b=FYVTtSbXd2PhfyeukBHMOxs87Kwdjy3x1G88kJErBZ9wD5jn8FnMZUWvIUDvbXgF7N+ypfQ2NrWXoF1+MZcyGvp1Voi2IK32IlOSs7H2EBxRQQmSEq/DupGI6CBNVBIdIPGbNdZnYzyD4mEd4a551+1pijIEbr70R8vO8+26ga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560036; c=relaxed/simple;
	bh=SfESCifJlQC8gwG7XGfkvZA9ud2mCQVHiHUPsZbe7+A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCPL6zKAj6S8lInv/aRbAIn9/0GCGKsEmNv3bfdm2DHcJ2tAjUxIT9i/+0Yl38YDQ3w9S1CKyEgGMFOHrrNKad94qyzG1zPUwCPIH8BnY+3pikpNC6cs//AD52fXRRmJoUquXk8mqdwJL6BMVUmMmrsjUvy8ga6SbH98D5vTYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKpsf3UV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKpsf3UV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b64c8311so5101495e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 01:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780560034; x=1781164834; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fwggcNXE/qZG0R5u5GBwdY5Nt2S4QAlzMN0onVXeTE=;
        b=iKpsf3UVBzubbxZrApxSwB4HfKix5tkwbw5BZ4kLJVdhURg/+i7m0Jt9uA8suoGyCQ
         JpFPO3WHWi5wTEIjycrnALYLoE07c6LfOj4h5Qr2n/jnL8pIr/sU2IvhHxNdWzwCC69Y
         RhIzWz/dv7ogTUcMhY4Xb0WrcnDIAb7IOjBZNQhpHbOdswNrm3U9P8v4jkH7dXNCE2hb
         e0cVZv3TLjw2fD2OflYqESulrskwuBmQs72zwc6AJjP0Hv0baWXd9v0yTxrAqCI7Rq/Q
         sLdQBLuvRaIQ8d8y/6gc72C0t2r7cdvf3Aksp2gB8p5dsuvnUgRhthcDvgoki8onDBbn
         E/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560034; x=1781164834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fwggcNXE/qZG0R5u5GBwdY5Nt2S4QAlzMN0onVXeTE=;
        b=qRF2tGmySuRmTDZtIw0PfT1LsH7RNx2YNqbd8SmcKltbesny6eG2W8rY5lW9Zw2kDb
         IwDp2+OuFRR8/C6+P0Uldm6hzf40U7YytN1tF0bSjnd2DCRdvBIMod12mO6RpK2AK4vf
         yUKtKOkXC/5J5HTcpkfcqucWYONwGyMj4HXMkA3p9hkf7kRGrCW1yydAn47URab7lUSF
         iChHu+dqbhlB/YegIObEcV4iECYNGiORzmyzcOBowr76AfoyDm++Y8jUXsBs/UTncjQk
         X770NO9x2JPxve8i2EKaxAK0B655DjGlKxcZTqRR7CfuZZSnF53qs1AvFxN4d8IPJFVh
         vITA==
X-Gm-Message-State: AOJu0YyS94EEwSWqqVS1hz0N624QidYwqEi7/PgjyhU1Lcd+7EHgyNYe
	6He/6zxw4rX/thS1mJ05ZQFtt+2l+1PMkCbZnV+LqdWtnNzmFahQnaz80c1GFw==
X-Gm-Gg: Acq92OEhUz1uDJ4/jq9odls/tIBq4u57H+pRQ4oh596TdxdWU8KxEd7tDN2JocHI1Ia
	/dD0ld6CDWouVuODcDlO+CdW1GMOPJPDyVti3twCy2uUubApHG1jitDB1B73tV9sEcp1D9luwbE
	hEML7zqztdKQrDl5wU6ZSdSZsO+Iu7bpDEDXIlTfbqq5amhNMwL93VtbUSqicV/p4stHjHmexqW
	G0Ow73TGrB7fGh+YRcT0nqMCJlohANitRAwtOLZdJB50GrDhe6b41Cmm3RjjZPyREx2iVEWDiS5
	xU3DpQ1GEMGF7hA2ANQlcIuA4IazdbQloUfGSjEki10HCaqJA+osgLiiff4jQIQBljZGR/qx5Sc
	m9TUdd2YnnTHcQdUdQoFWA7m1/kn8Hww6xg66CRaRFKDWdUVPNV+cLsd/ruwq/n1C5+yUI24M9I
	b25oQp85T1yrYpoCG6fbE1ltkDrdL0g/JRNs6e
X-Received: by 2002:a05:600c:458b:b0:490:b409:94f4 with SMTP id 5b1f17b1804b1-490b5fdcda1mr115062605e9.28.1780560033621;
        Thu, 04 Jun 2026 01:00:33 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda363bsm1541050f8f.31.2026.06.04.01.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:00:33 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 4 Jun 2026 10:00:31 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv7 bpf-next 10/29] bpf: Add multi tracing attach types
Message-ID: <aiEwnwBeP69ZUpCA@krava>
References: <20260603110554.29590-11-jolsa@kernel.org>
 <20260603113751.DC4C51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603113751.DC4C51F00893@smtp.kernel.org>

On Wed, Jun 03, 2026 at 11:37:51AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing `BPF_TRACE_FENTRY_MULTI` and `BPF_TRACE_FEXIT_MULTI` cases in `btf_validate_prog_ctx_type` causes valid `.multi` programs using `u64 *ctx` to be rejected.
> --
> 
> commit 0330f287f02c3a32c9ab8bf7f4f5a6ad6cf7366f
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Add multi tracing attach types
> 
> This commit introduces new program attach types BPF_TRACE_FENTRY_MULTI and 
> BPF_TRACE_FEXIT_MULTI to support multi-tracing attachment. Base verifier 
> support is added to recognize these types and accept them as sleepable 
> programs, while deferring actual target validation to link creation.
> 
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 8ed484cb1a8a4..521ec2a9051ed 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> [ ... ]
> > @@ -16314,6 +16314,8 @@ static bool return_retval_range(struct bpf_verifier_env *env, struct bpf_retval_
> >  		case BPF_TRACE_FENTRY:
> >  		case BPF_TRACE_FEXIT:
> >  		case BPF_TRACE_FSESSION:
> > +		case BPF_TRACE_FENTRY_MULTI:
> > +		case BPF_TRACE_FEXIT_MULTI:
> 
> [Severity: High]
> Are we missing an update to btf_validate_prog_ctx_type() in kernel/bpf/btf.c
> to handle these new multi types?
> 
> Currently, BPF_TRACE_FENTRY and BPF_TRACE_FEXIT are explicitly whitelisted
> there to allow u64 * as a context type:
> 
> kernel/bpf/btf.c:btf_validate_prog_ctx_type() {
>     ...
> 		case BPF_TRACE_FENTRY:
> 		case BPF_TRACE_FEXIT:
> 		case BPF_MODIFY_RETURN:
> 		case BPF_TRACE_FSESSION:
> 			/* allow u64* as ctx */
> 			if (btf_is_int(t) && t->size == 8)
> 				return 0;
> 			break;
>     ...
> }
> 
> Without adding the new multi types to this switch statement, the verifier
> will fall back to the default canonical type (void *) and will reject valid
> multi programs that use BPF_PROG and u64 *ctx.

yes, we disabled direct ctx access for tracing multi programs 

jirka
