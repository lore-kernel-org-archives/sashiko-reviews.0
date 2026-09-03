Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DD344E672
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457329; cv=none; b=UbW3cwSn4C7JDGPSuEwdmXThI3qDjvcpBubQlHBTPvTJZIiOUaHYik3LcqtgNSIsXlQu5lkva9DuNkhTl0EwFCP/bhobJc21SDIUhSV9JVTZDjiQt7T5r8MwkfX9qJlfNYaSrkwe8Y3tdOc0PUjxG47pwil5sowoa+Hkcirej/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457329; c=relaxed/simple;
	bh=0c6h30lvNuwZCKR0KcWCDjNBuyr8IdwzE21BpfW1KxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HR2nyPq4H1ZaWv9+thVMXCslTBdAXv9Fff3nC5IMrcZPhACQsczVOIAoEsR0TfjgjdLSFkfwWR1W3Ij31ttoilI0zkga7tXys5xpLUNgsmrtCLa1QYStVJI4SgdsLPo2KUqKt1NC/TlQ5xjC/ZCyQRmq2tc6hJVHCi9VxRWfzN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vjkYrku2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vjkYrku2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so108093f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 10:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788457326; x=1789062126; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QcOMac4m+jPNu8ZvLbuOuvzBr1+9wApKD/IVdlK39Q=;
        b=vjkYrku2ipjyff1SjB2yQMr5v0EMH+BrySOY2Eh6zPx1LiWXLh+5Eva+AtpOQ2Fxab
         cBNPpBsZXnoaPrKpocKtfy8eks3jaXzBhAFKhbOWPxFCR/A5P9tm/WDvRzzcx9eMsAAJ
         P4BV2JDRaiHfPtqBex3hf6utRj2cpqaPrCCVjyg4W15lQf7SLwWjpg4RiUc2w53VeVn+
         1jiSGtHh3DjZ6IsJBR0Iu5DOeRJEVR++RtxVsgyD7vxRzs62O6qE7/rosl+CnlG7e5Q9
         AlhVP5m19d4zOpadFSsWCTgv5a6ls5jrOZ2XP+8eMlWm73YH5IDwIoJKsoDkaUizsSAW
         UJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788457326; x=1789062126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/QcOMac4m+jPNu8ZvLbuOuvzBr1+9wApKD/IVdlK39Q=;
        b=VWZaQRe1t81U93yyFyX3PE2WCAZpl3af6fqWgrgcjAIB0hdawUOIZN9P12Jg1N2VML
         zJ9V6R+oq5LBKC/wSxMlTIdhW6HM1NpLHZQLZ0JT7y2Xj1XzQCprzPcL0WCk4tKg34db
         QudRsOVY9nd8ic6pyKwCy/npIPNJEr6kSM4IrNuI/I0OxlWEV8rfgRZplxjOLJ+yvhpr
         ezaF/oYyCippX3O64Xjc2VUA6uQdkq3tBK2IL7JXNjK+053cgLivnTjFPorUbMWxt91J
         ux+z+NiNq7CmQ0ZFsEjXEqPQJJlIEje6DjwSeART6iXhAKabxRkBNJpyrCmnblvnmxLl
         +I4A==
X-Gm-Message-State: AFuF++nsmg2NwnW3snVaI5k6j5sUvcf1S23Vg5SV4WFw7oFCp+3dBSP8
	C0PoQ8Ds+4rp7Ii4wWwWucbpzwMlEcz08BDHIbd1LCfO0+gyW4UATV9WvnSp2dywA0PdJeBfj6g
	czbDCoQ==
X-Gm-Gg: AYBFou3kuptgE9JqbWfNtQiHKYdchlEVgqQ0L3Uwf9UIZyGHEA3yg/aZCfVJOnuxmnh
	TVL02Lxmj/Ue3rLwdwqsoMF+TPzLEJBCJhoR2aXxSM5LoAPz7t/2vRbLSzaSBUN/cf3TrjDsjIu
	UpXHbpJrA0RlRbZKDS2K+NGRuxwZOVpXzhbjy6cib5680oQHbvQKozRacmvbF4tEqwHWbXIF441
	9pVSZuAMmLRDTecgE1LP/zgpHGAknElN+NJusEOG5O7HP3zXG/u2HXkSfL3sHId/eWTuk6klW5x
	aUBrZpnSRRJROXa3We+1PwTSfQOsIgtiuvtSfzzqPHavyGeYQt8sgnYe5gNm2x70t9Q0hKtg2J4
	PBtT4SmJRL7ivak3kwpFDqYAkpASv66h9SSlD/L+HtXmNQfIM3qyOErCynx+Bd0NvGJLNzmyi3y
	Fq88shDeMdDZnwWGlBHSdTwUS2iuANIyL0yujKOxt/7GlJ+bkEnUpHrXgoIpOUY7qxa5zYQuDqK
	OjAEHkAZ0oiRTt3TOYrDoCAw/dEWGK4yeSWKbIbpQU=
X-Received: by 2002:a05:6000:4b03:b0:485:81b9:f09e with SMTP id ffacd0b85a97d-48586c2faa2mr1582388f8f.0.1788457325756;
        Thu, 03 Sep 2026 10:42:05 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858791bddasm350031f8f.0.2026.09.03.10.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:42:05 -0700 (PDT)
Date: Thu, 3 Sep 2026 18:42:01 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steven Rostedt <rostedt@goodmis.org>,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] ftrace: Add checking nr_subbufs to persistent ring
 buffer validation
Message-ID: <apmxacws0NlAdcAu@google.com>
References: <20260903132728.7fb27d34@gandalf.local.home>
 <20260903173823.4D61C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903173823.4D61C1F000E9@smtp.kernel.org>

On Thu, Sep 03, 2026 at 05:38:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Integer overflow in per-CPU ring buffer metadata calculations due to 32-bit arithmetic, leading to memory corruption and false validation rejections for trace buffers larger than 2GB/4GB.
> --
> 
> commit dffcd0268ea5b9908d6dadacec8d07651bd25ceb
> Author: Steven Rostedt <rostedt@goodmis.org>
> 
> ftrace: Add checking nr_subbufs to persistent ring buffer validation
>     
> This commit adds a check to the persistent ring buffer validation logic. It
> ensures that the saved nr_subbufs in the metadata matches the expected
> nr_pages + 1 to prevent mismatches.
> 
> Closes: https://lore.kernel.org/all/20260901164836.D962D1F000E9@smtp.kernel.org/
> 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -1856,6 +1856,11 @@ static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
> >  		return false;
> >  	}
> >  
> > +	if (meta->nr_subbufs != nr_pages + 1) {
> > +		pr_info("Ring buffer boot meta [%d] invalid nr_subbufs\n", cpu);
> > +		return false;
> > +	}
> > +
> >  	buffers_start = meta->first_buffer;
> >  	buffers_end = meta->first_buffer + (subbuf_size * meta->nr_subbufs);
> 
> [Severity: High]
> This is a pre-existing issue, but could this 32-bit arithmetic overflow for
> very large trace buffers? 
> 
> In rb_cpu_meta_valid(), subbuf_size is an int and meta->nr_subbufs is a __u32.
> If an administrator configures a per-CPU trace buffer larger than 4GB, their
> product might truncate before being added to the 64-bit meta->first_buffer.
> Would this result in an artificially small buffers_end, causing valid buffers
> to falsely fail the bounds check on reboot?
> 
> A similar pre-existing issue appears in rb_range_meta(), where both variables
> are signed 32-bit ints:
> 
> kernel/trace/ring_buffer.c:rb_range_meta() {
>     ...
>     ptr += subbuf_size * nr_subbufs;
>     ...
> }
> 
> Does this signed multiplication overflow for buffers over 2GB, causing the
> ptr to move backward and potentially corrupt memory when written?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903132728.7fb27d34@gandalf.local.home?part=1
> 

hahah, yes we know :) 

https://lore.kernel.org/all/apmwYLVIxX-C21aB@google.com/

-- 
Vincent
