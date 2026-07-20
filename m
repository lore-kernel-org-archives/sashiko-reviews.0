Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028FD3BFE34
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 20:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579480; cv=none; b=I92bGo4pn/nCCiivkBRBZytI0oMW5VT5zCD/0cvRdeZa9Wccv7c8RROp8etkYmMNrKuJ2fDSZlolKMIWvvuLMqo0fqDVgzCYu5NxIVDoKqtgbbywPJEGWSxpDuTb7z2j74ukeJI6I85I9WL2zriDKtr6hYxTD2vOHMOOo7n9C8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579480; c=relaxed/simple;
	bh=I3jMpv/5DGvM9NEV89+x31yvVYsqu3u19/LKnmwpAic=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTSLyPowN2arS5Yjhz+wMcZ85GrFBojuVoy4V6Vws/Hn26Naa77G2V6d7UjBA7E3g/vMWFMI49uUPMdhHEDsbaXFBFaRO8TGubckI3/Jmn255sAuV2zqWdSX85AJgcf/iUGlIDbIhBjtn7rObKubPKDbhhyMfR9TgnsY7SZOsis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0HShKUB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0HShKUB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso14531305e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 13:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784579477; x=1785184277; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lGw788WReiLT2i//VOMJJGwnZC21ItgMOiQhhkqCZ5A=;
        b=b0HShKUBJtT9MG1aqaJakLd4Rc9qK6e5krKy9zm+TUwGAbqk1pjf+0Nm/BDVPXv5ye
         W0MEHMxFoMGA5HuIiLBWuYa13S6WWiQ5ie3eOA0HntGec4j0Pw2bcHsg4jaWnjHP8csX
         ZrxDslI+jxO/vuoJpInLMyq5m+sjmFYqznLYXQEe0dpbteNE4Yjmcw6AfQW+UL7uvPjk
         UqNHX0LF1xTubRJUTxNmmWMavMn+Lsq/lHhSwBYM83h42jEv+6ZkrL6lkERGaABBpUNK
         aCCaPMkcb2uuE2pzy3/eY4b3cL+59ogG5IdFNvdwu9+E7Fmz2DHKonDprohcrMHGKV+f
         RSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579477; x=1785184277;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lGw788WReiLT2i//VOMJJGwnZC21ItgMOiQhhkqCZ5A=;
        b=NyM32sBqhmxiZizZNWCZN5jh8MyzrARaTkJHufG770MexqQKb+YaT4Uaytz5c87fwQ
         YBiNG1FLj+WvMUR74soO14kCPMzB0u5jL3OSoqq3W0ynXhDKf3Dj80PA0831WJ58kdhR
         EjNbz+aeuRrAc76fa17YORjGwUnwYyl/4AhfVETB5eudOIrvbwkvCE8CQ3hA76ejN3GM
         NALwPV3hBPhewPehtH7gXhuOvLC5CCTyF1vnuve3K3rreEyIn7hqSDdqtrIfZCpYe3y0
         WiHgzzETITuxYO+rdMySLt7W/XXxjJXPPDRA2DjTT4/PwTYMbgnWuAVf4eEJlaxbfdtN
         wH3Q==
X-Gm-Message-State: AOJu0YziSis61csgNJ1hcQiraKTuyvUqJyA4yi+iMt7vcfeF6pB3lAsl
	+zeYXxmTw1o9O64Ry2AqT0+vbFK872T/nUywEfPxySGB5bOso1ZFdSAUt7L473jo
X-Gm-Gg: AfdE7ckNWOqJDpP9Dq6n0Sf7uRSVAV+DlWXLuQV4UZM/gYMq0pMzd9ImYnVVeRbI2RU
	qptjCBRwc/IGWHtHhNRbZT6YRqrZ9HySTH6pVNfohpq6NMkyeQvn5MnjUlVMszzID9wotItLN/L
	fNaeqt2bXRL18kDqnVMot/eSBWZxDh1yJV8OeFpFWyn5YZrPIGHdmkZ3UkYN6050dZlTFgQ+9bK
	TlwdHRiC4FAU4BrnMKugXh5ARTzTaq83WtTrhGOWji/uK5tRRcvJulKWp0h0DLL5IJESFtaR4K+
	zu1MyOmLB+3IwmT0SgShes81uRyTwwlSZBZ5bpjxlpr3xyAvGOC9Rd5Me4z0wlm0pYDzSbDWx0F
	hRTwdThsUi6BlaAEc61P9RvtQ0JUTFQ5+KrpuqzV0UHy7DgUUBxZ2Zl4uGfGYjeJNyg==
X-Received: by 2002:a05:600c:1d1e:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-4954a3d0cc7mr164655185e9.2.1784579477131;
        Mon, 20 Jul 2026 13:31:17 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565304aefsm14411305e9.0.2026.07.20.13.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:31:16 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 20 Jul 2026 22:31:14 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/9] bpf: Factor stackid_fastpath function from
 __bpf_get_stackid
Message-ID: <al6Fkgma-zFxbM6J@krava>
References: <20260720085351.655075-1-jolsa@kernel.org>
 <20260720085351.655075-3-jolsa@kernel.org>
 <20260720090951.8AC2C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720090951.8AC2C1F000E9@smtp.kernel.org>

On Mon, Jul 20, 2026 at 09:09:51AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] A pre-existing TOCTOU race condition in `stackid_init` involving `sysctl_perf_event_max_stack` can cause a `max_depth - skip` underflow, leading to a kernel heap buffer overflow.
> --
> 
> --- Patch [2]: [PATCH bpf-next 2/9] bpf: Factor stackid_fastpath function from __bpf_get_stackid ---
> commit 1a0215d43cbe727ac7583d25380f0acdc326abc9
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Factor stackid_fastpath function from __bpf_get_stackid
> 
> This commit extracts the fast stack hash and trace check logic from
> __bpf_get_stackid into a new stackid_fastpath function. It optimizes both
> the just-ip and buildid code paths by avoiding new bucket allocation during
> the fast path check.
> 
> > diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> > index 0eafe55b18289..7bc2a966e3e81 100644
> > --- a/kernel/bpf/stackmap.c
> > +++ b/kernel/bpf/stackmap.c
> > @@ -531,28 +532,46 @@ static int stackid_init(struct stackid *stackid, struct bpf_map *map,
> >  	stackid->hash = jhash2((u32 *)stackid->ips, stackid->len / sizeof(u32), 0);
> >  	stackid->id = stackid->hash & (smap->n_buckets - 1);
> >  	stackid->bucket = READ_ONCE(smap->buckets[stackid->id]);
> > +	stackid->hash_matches = stackid->bucket && stackid->bucket->hash == stackid->hash;
> >  	return 0;
> >  }
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but could the stackid calculation
> in this function underflow and cause an out-of-bounds write?
> 
> Just above this diff in stackid_init(), stackid->nr is calculated like this:
> 
> 	max_depth = stack_map_calculate_max_depth(map->value_size,
> 						  stack_map_data_size(map),
> 						  flags);
> 	stackid->nr = min_t(u32, trace->nr - skip, max_depth - skip);
> 
> If sysctl_perf_event_max_stack is lowered concurrently while a BPF program
> is executing, max_depth gets capped to the new smaller sysctl value.

that can't happen, perf_event_max_stack_handler needs zero in nr_callchain_events
to change the sysctl_perf_event_max_stack, but it's held by stackmap

jirka

> 
> If the BPF program provides a skip value larger than the new sysctl but
> smaller than the old one, max_depth - skip will underflow to a large u32
> value.
> 
> The min_t() would then incorrectly select trace->nr - skip, resulting in an
> unsafely large stackid->len.
> 
> Later, this length is used to write into a bucket that was allocated based
> on the smaller map->value_size:
> 
> 	memcpy(new_bucket->data, stackid->ips, stackid->len);
> 
> Does this sequence allow a kernel heap buffer overflow to occur?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260720085351.655075-1-jolsa@kernel.org?part=2
