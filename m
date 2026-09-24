Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DA84734CD
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252787; cv=none; b=YaCH7Ld7FJZ95hs95DiJs0RDjojzhtMyKVQemF0qLpd15ds9wx8hZ/waULtZeG6dAAcfDKDHa6Y9kmal44PX/h/oV2qzG/uwZ32eJDy2Vb1Q4OvxgRplOlfzVA9MmXhQdhNJGEDGTBw2O1ZCkOSKI3FrZEVZbNKj/1c3MYhXOjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252787; c=relaxed/simple;
	bh=hYEF9jVGBYNSAPyKRF0WoUj5Wb6jNmc+eEi2HQ3zXIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2NQgkqOeLh47p0hciCR50RFGD58n24tE88NUesqT8nR6uvtdGK7nuKNPF7ZcOoQHCvdaPxjMiVyuwl+A2SI1FmMPivt1TxU7gnT6PFiev3/XRCwCcetLoOE9o76DjdAtG1Z59AX4bP7znlGqEdWdbd1O9i+NdHFdr37pjqHYy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NUTL9gbG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NUTL9gbG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so11541645e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790252784; x=1790857584; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sTttv4o9hZeXqnTlw64U0gcVaLM+J7dfrd7tSslnvX8=;
        b=NUTL9gbGjmFa96GGFkydezrOlBEsKxhiA3CpevqKiO6CtoAzsdi2sX5xiczHEinHyC
         EOC206nzRuF4vLm7DF+Q1a3lV5WPxv21xkqBN8qs3gug0ajfSP+tquyU+3iuf+2RevEz
         0ZzfQCnxQNoSG+Lw8hdHCJP+nCFWZK9RmMJL3DVh2/bWe1Y68LuQqsWnXWQ+FYXSiA4w
         KTjFeXUz4NCNnIG+qyCo4xTAK644STbzKPFcBYd8kNjYBd6Ok6P03IiGd7M9m0qJauMN
         2IqhKU6N6J18Z2RWx4bXj3ba0iLFRt6a+Ueq3MXns3fpm9gnnJB7iU1xb1rvPngk5G3d
         ls3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252784; x=1790857584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sTttv4o9hZeXqnTlw64U0gcVaLM+J7dfrd7tSslnvX8=;
        b=Aus0yaqHTmI8cU+yD13ru3O22HJBcpXHnOEegsMFRo4UNsejQQjut4zTpA7WNaWjOw
         Ry14z3gv+hY4M+eIs/DQQUgGXdwpNRlMSEdvmERZx9EMMPGqP9XnEUuGiqwBDKp6VwVE
         6twsP7Adls072KGbjt8ORx9soOj8xVlPvCV1RGh3+flgzz5Y46CiulhQf12dR0a/0ork
         KOGNCxeB1bq6iUoydYcR53HC5Z7Vq5Kbnp+N7rlApcir1AVneUVpG7Vx+n7Te45TrXxa
         H+dt+uJexZx0UbJhEINp/0jKwBmQV16wBmbAMMAN1XlNiCRpX1OSqEUhd1YbdU5s9pER
         4x8g==
X-Gm-Message-State: AFuF++m//C/3+IoUGJm1ZoTEEJ7zxw42Wx2MXJl0v+aIOS9uwWKE5usM
	td/M5F6gWqQQ2gDJQMn8MZ8TGhNoNN5r89uPCRiUoJFA8DMsb2KyJJ5KsrYl3dhRneZi1upgDqi
	86/vbzA==
X-Gm-Gg: AYBFou0dgLHNfDjXENN+6b5THp7o4QsXZ2hVU9GkVSc/3OD00B+NXphFfyZANYdw//q
	O8BchGrb76conBZGR4Z9A6/hFLO9U4dSmdYdzojqYYG5BsKd0JJ9tTNkvqR0FlRVYVI/Egyeuq2
	TRHm/OzRD4aI0cKITaAVW656Wvraz93JH0M+1D9oNL71NMl6K21c4LryttUYhJuBIBnjZAQ/0ri
	BkynFwDU8LtvkCc9046cTZuNYNuqNbyMS1yYUbeVxtXK3p1jw2Q2yiqHd4JZNUZl/BnM4kU42Rd
	R/1L4aH114vX2d4oZCt913+2a+end2IyxaYz+X1rGdnbhJKxvYaHI8aV7ySdHyNsbmb1d+w4pNh
	bkg3Y05Ci+oo6DF3nedW43Yuwft9/jNFjYD8MTvujPO1vUqB+ey1fd2bs2I8/HkmziWx2qlrgaI
	9R/bWAzhFEZM04bxajMkAHgV0p5hJsHkQ1TPrEZUqK36tfHGZc/bUlshtJCxakza4yxbh8RYJiQ
	Y89paNHE5/UIogzhFBJTUgWC9GlbngFQ/rZuA542Iw=
X-Received: by 2002:a05:600c:8411:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49fe66ef334mr37543295e9.25.1790252783277;
        Thu, 24 Sep 2026 05:26:23 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b9c59dsm60308195e9.1.2026.09.24.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:26:22 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:26:18 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/18] tracing/remotes: Gate tracefs files opening on
 trace remote registration
Message-ID: <arUW6hC3vn1EJLYI@google.com>
References: <20260817135517.3919534-1-vdonnefort@google.com>
 <20260817135517.3919534-2-vdonnefort@google.com>
 <20260817140902.EA76D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817140902.EA76D1F00A3A@smtp.kernel.org>

On Mon, Aug 17, 2026 at 02:09:02PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Medium] Error paths in `trace_remote_register()` leak the dynamically allocated `trace_remote` object and tracefs directories when initialization fails.
> --
> 
> --- Patch [1]: [PATCH v6 01/18] tracing/remotes: Gate tracefs files opening on trace remote registration ---
> commit cea65090c9ee422e607003e731a26fe505c23e56
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing/remotes: Gate tracefs files opening on trace remote registration
> 
> This patch adds a global list to track registered trace remotes, preventing
> users from accessing tracefs files for remotes that are about to be
> destroyed. Tracefs open operations are now gated based on whether the
> remote is present in this list.
> 
> > diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
> > --- a/kernel/trace/trace_remote.c
> > +++ b/kernel/trace/trace_remote.c
> [ ... ]
> > @@ -932,8 +999,12 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
> >  	}
> >  
> >  	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
> > -	if (ret)
> > +	if (ret) {
> >  		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
> 
> [Severity: Medium]
> This is a pre-existing issue, but does this error path leak the dynamically
> allocated trace_remote object and its tracefs directories?
> 
> If cbs->init() or an earlier step like trace_remote_register_events() fails,
> the function returns an error code without cleaning up the remote pointer or
> calling tracefs_remove(remote->dentry). Will this prevent the remote from
> being re-registered later due to tracefs naming collisions?

This is fixed in the following commit.

> 
> > +	} else {
> > +		guard(mutex)(&trace_remotes_lock);
> > +		list_add(&remote->node, &trace_remotes);
> > +	}
> >  
> >  	return ret;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260817135517.3919534-1-vdonnefort@google.com?part=1

-- 
Vincent
