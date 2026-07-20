Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4EB3CA49C
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 20:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579470; cv=none; b=EoZERrgMgc8zUz24s0zxJ3FF0ZbXSDaedLRwn03cBZ6YNXBy3lpviQZrpElKuAqbFUmhtTolgZkhdOg0BzTNHPz7yc07eWNTWwosHWzaApoqQ2COwny4G47Jjdf9+Ix4/oL0YhrwDqHCuGVby51XKmKX7cayDFfrlUEPbdR9j6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579470; c=relaxed/simple;
	bh=7Rh9K/aMUgrUkaTFrCF6H0sgp3ex8gQh4yF3iV3opCE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htnNZeBUxTtPopTssTdrFvfOCfUIPtd7pu6S70SlXJKeiMxCsKWX3OcUyDoPaX+eRwW3aI8DnsdQ3kRkbw4kmp5d/y7ViblrUSydWmk8ScyIHlWOFqJ1vM1NnKdciMfsAYEDMQbm9cUOKjaG5ODbzVMT5WpwggNNxkYpCjLaxhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnfEQldN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnfEQldN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-476a130c138so7066301f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 13:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784579467; x=1785184267; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HCoN88NAevl2MQDJ7m5oXovQm6Rv4VDkCN88nmuIeQ8=;
        b=RnfEQldNyJtzIlZ0x4g8CpEQ3sLhtB1Hcfa0LlD3MU/wR1TnPBOmkWqck4Wi1AIQy+
         eZlfB/qofAq4LqZgcFieX4Vi8iJs0DJzIr0oySXGphFRzWANIhKCDczMQlbCRi8I2P3T
         qxWtZfh+X3jbrfYUTxRhOPS7reDgPw7KdhHC3/+4xcvKm8csP6VucqX5hYb+UOf+PwjS
         dV3pheqnk2fzsBwIHcGPqV7CvydkHG49RPQdRJjxCdq/wz+BlQSXj4dkmeqn+hsdbgrl
         Xfl2rsTu6PgWK4K5vFo4FOOkzWoj+CqhIdn7jcJ8Hbs3BaM8k0zi7wu3FiNB7avBV8o2
         gcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579467; x=1785184267;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HCoN88NAevl2MQDJ7m5oXovQm6Rv4VDkCN88nmuIeQ8=;
        b=jUnbS5LqQfEM1jJRLu1bOCjCUCfav8locI4N5PKt6t2Da4uXgPt9SorTf7OVxJSGNe
         AaD4DUH7H5YADzqzpYU5BvQ5iAB5/ctlEsjAopxRXQXy2bWaRIHciF6vWoLBXTDQnktC
         P9S0XOkmxkmcEi2Rb1PaMitlrJ0yDgyFRUkchxIqy1m1B6j8+QFJhUAmeNfdxIcLkFsA
         fNoHLsyxh/sskaC7iSS3bt6cox8xBa4ksqYk9aOskjDXWpYwdH4zUA1PdRymNwVN86EJ
         cIvRKxqylADMYhRJ6DjeR8bGacqxwtRvBostIRxGX6Y+MgJmn3J4Fn6AJOZ+bBumksrf
         IoWg==
X-Gm-Message-State: AOJu0Ywa31GEfqU/PUdwkmUCwwVpW7QCZBwchiemcLi9T3iA0df8T295
	h8iEjd4oWpC5KpNPPQ6Y+F2Zsc9jQcmG4htL7gaKdE21sdM8o5SA67W/+F3lVkGD
X-Gm-Gg: AR+sD11iCBWfLMN0jZ6KY1d8FOiQn9LUvLDpRyKf15+6dxlu6KfC5kX0mJKp5ruWPqq
	keQDvEla69B3ksDWZqO+Vh9fCS7gEjaxEsh3vWvyesBrV9VvlYjb1dSAI/QLXp/x6QspWJzC882
	AAYzO7KQEiKqPV6L399VfmTwQUyPWXB5kLfVVu+5pHstleejIlndEqbLpxPK0TKgPGKH4/DeWhr
	xvPmHtUxj3dWGW3avBR91gdlwebZ0VdCNDBb1AtSRR/53P+GvQs9yQ8GGocTAUhEmt61VyiEgW5
	CD0Jbv/BDZoP2lJgAnmlFX87Tm9/1Pp1+JCTgKkJx/dRWP1XxfoZXum/yFNpGWBn7T/T7i/N0Fu
	zyUe+82hlKO62dpCJThd0NSx6X/PsVOgCUck1AtyS2v3JF/wdmikSBOUDL+ILQFaTPg==
X-Received: by 2002:a05:6000:41f8:b0:472:8c12:b93a with SMTP id ffacd0b85a97d-47f62318cdfmr18135543f8f.28.1784579466837;
        Mon, 20 Jul 2026 13:31:06 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edcf8dsm35417470f8f.27.2026.07.20.13.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:31:06 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 20 Jul 2026 22:31:04 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 3/9] bpf: Factor stackid_new_bucket from
 __bpf_get_stackid
Message-ID: <al6FiPN_p5EVMrob@krava>
References: <20260720085351.655075-1-jolsa@kernel.org>
 <20260720085351.655075-4-jolsa@kernel.org>
 <20260720090141.54DC81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720090141.54DC81F000E9@smtp.kernel.org>

On Mon, Jul 20, 2026 at 09:01:40AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The newly introduced `stackid_new_bucket` function accepts `trace` and `flags` parameters which are completely unused within its body.
> --
> 
> --- Patch [3]: [PATCH bpf-next 3/9] bpf: Factor stackid_new_bucket from __bpf_get_stackid ---
> commit cee0ea77a9c1144b54fb0472b1788623044b5650
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Factor stackid_new_bucket from __bpf_get_stackid
> 
> This commit factors out the bucket allocation and initialization logic
> from __bpf_get_stackid into a new stackid_new_bucket helper function.
> 
> > diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> > index 7bc2a966e3e81..48a2e28f0c68a 100644
> > --- a/kernel/bpf/stackmap.c
> > +++ b/kernel/bpf/stackmap.c
> > @@ -559,31 +559,53 @@ static int stackid_fastpath(struct stackid *stackid, struct bpf_map *map,
> >  	return -ENOENT;
> >  }
> >  
> > +static struct stack_map_bucket *
> > +stackid_new_bucket(struct stackid *stackid, struct bpf_map *map,
> > +		   struct perf_callchain_entry *trace, u64 flags)
> 
> [Severity: Low]
> Are the trace and flags parameters needed here?
> 
> Looking at the implementation of stackid_new_bucket() below, neither trace
> nor flags are used anywhere in the function body. Could they be removed
> from the function signature to clean up the API?

right, will remove

jirka

> 
> > +{
> > +	struct bpf_stack_map *smap = container_of(map, struct bpf_stack_map, map);
> > +	struct bpf_stack_build_id *id_offs;
> > +	struct stack_map_bucket *bucket;
> > +	u32 i;
> > +
> > +	bucket = (struct stack_map_bucket *) pcpu_freelist_pop(&smap->freelist);
> > +	if (unlikely(!bucket))
> > +		return NULL;
> > +
> > +	if (stack_map_use_build_id(map)) {
> > +		id_offs = (struct bpf_stack_build_id *)bucket->data;
> > +		for (i = 0; i < stackid->nr; i++)
> > +			id_offs[i].ip = stackid->ips[i];
> > +	} else {
> > +		memcpy(bucket->data, stackid->ips, stackid->len);
> > +	}
> > +
> > +	bucket->hash = stackid->hash;
> > +	bucket->nr = stackid->nr;
> > +	return bucket;
> > +}
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260720085351.655075-1-jolsa@kernel.org?part=3
