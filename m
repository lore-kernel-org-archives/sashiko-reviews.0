Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3203538DC45
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 05:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789017846; cv=none; b=CRGkX2Uba1bFhWFNxxHC1xMkk+tPcCUq5qStnmoPd6bZNVtNnfjrOBK7VubCOTAHWzSmsHkUd073ZOcbntk8yeLVs2q2h9aNKqtItIPBK5fw8TdDkUPfBYVJjFiBUDJyH97UYwG4BQRFh0cLamQCWpOUpUZhEV1cywlxI/iYj4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789017846; c=relaxed/simple;
	bh=0uwXnaTUosMC/Icf2qUxADl52CRHI4T5CRZDpL/gEQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuDciiR7Fmq/Jdcf85isvLSuAk9HvQWYpIG2lBq1tuz5ydT8kwXoMysHl7P6qLyhxDK311MOCsvjMZf0v0G0Lbq0BxkhOJen9fiQRcaxT4AqSGr1f8uYUmh/xXX82IrDWyM2O+28yGDcI7t0C0G55MqFqwuGAmKzbgu9Aa9WihE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.sg; spf=pass smtp.mailfrom=starlabs.sg; dkim=pass (2048-bit key) header.d=starlabs-sg.20251104.gappssmtp.com header.i=@starlabs-sg.20251104.gappssmtp.com header.b=MwHTZVyg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-sg.20251104.gappssmtp.com header.i=@starlabs-sg.20251104.gappssmtp.com header.b="MwHTZVyg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2dd05e8b98cso10657975ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 22:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-sg.20251104.gappssmtp.com; s=20251104; t=1789017844; x=1789622644; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pvypTGKdePbQiPk8V3bzpkE/0k4igHkbObf9bmT4wd8=;
        b=MwHTZVyg1TO11TvPieOTiJCokmwF9a/qEJu0+GF8MRY2wBLaGJ+b6Eh8YDuZBj7jSb
         piHA3zdqVC0hvYv9X3a8DwitE34282ZfeTEmBtDO9RSXw8X4KUtez4RsSFzO28r3xseg
         BgEQj0h0Yu+vdvxYiuUcYm0G1YXoKULdvVzPWGtK7BpXdi1g1YlnfYhe8uZf6KVzjA3W
         LOjkvOels1Hw7nagjgL0bM1wHN+0HX0JzLLEZs85YQEQaHIzK1mcqdrpl5s3VxLUWTEs
         6vytt42s/1iRv/Qxk78fv7y8+RLfYosE9lCicL3sOB+cGYFwZ82K0xD+0A8LcR02nbrA
         LATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789017844; x=1789622644;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pvypTGKdePbQiPk8V3bzpkE/0k4igHkbObf9bmT4wd8=;
        b=cE2n9hBf7CRBcq4j80hSB74L0Y1vl5FLX60/2AaTOBzloTlzySQ93p/V47cvkiYrwk
         zEAinvm94mgDURTb0uD60g4qmmJ9N+wDYOCxTUW4hWCKO7dyJafW77K/LcTOnzqX2QpQ
         r2gOk3L1SNUSk6gZQRGRLT8yJLXbSluj+2LKXlcxQUhBguQVQkHbaJpK+u6NbGaxVlrF
         P3kI+NFezjEVBUP2ab/QQNJw1KUo5MTjwZZmVLAwux6hiOwJ0YnVSbkIuKYeefugsVoG
         1v93FgBJOid8KXPjTp234VCKUgvnfSzZ5Y4jgUlfyliEjSo/UsCuZVNwuhQElhG/hGUy
         wzcw==
X-Gm-Message-State: AFuF++l0jKqs81PGS2cFXAjlw7Pe5UlzRw6TTm+oxYVWooHE5/mesx90
	qmVijqqnqj3XqXR2ePZ3lZuMHNKqzCy7Lvss7/hDKQDA6lloQS1RznHin/LR0nLZBWopnVnH3UR
	Ky4G98gDMgg==
X-Gm-Gg: AYBFou1fZ5lnFSTPxjFE36RjkYKdtmN8WP0j7gtVhwJlbLqC269BWEOHfJlSPCnUDTo
	ZiyKcK9Uv9XHRDLMQn3XZ4Z89/Zk8iTNxFCsUWqobjGuyjyD36ImH2Hu+tl5aMSZtOIioRom9K4
	g9A9vr27dLcBFWuBscQWv56QEyx9sH2k391BSyFwIIBfICty0C96s3OAGFsLcoXU53Tc0fYESVK
	xJYw+dbOBL9dmhARSHC+yf7rsTB6a8Ws0N5rMvEF6gG1cqdAsPyNHJG36k+LvkJIt9f16h9e3Xi
	r0NQAevFFewpvu/9cJ9lXxtnbVoizoRwzmKZyEQbIEGvqBD/IDQJhWSsANtsUFUSEZYCvs161aY
	R31rVVj40LgR715oGFFioBkHT8RIVv938QcsEfuW6Ik3lqW+4XYs4B+N4Wj1aEqe1GIgwSDjon+
	1BY52P+U07st4LFpKaavAhg0S51zOK0Dlb9L6rXzQdVAPzk8DPYXEAHIzo0kGRkunOK6HU1NeTy
	xxe45OTNnoiN7qKfWb7n6U964dIRbtrMin3tX3QP1Y6AA==
X-Received: by 2002:a17:903:2ca:b0:2d9:3850:2741 with SMTP id d9443c01a7336-2db12255f7bmr584733615ad.0.1789017844318;
        Wed, 09 Sep 2026 22:24:04 -0700 (PDT)
Received: from SLSGDTZTAUFIk002 ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497fbf8sm83895135ad.43.2026.09.09.22.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 22:24:03 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:24:00 +0800
From: Zafir Rasyidi Taufik <zafir.taufik@starlabs.sg>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: uprobes: Fix slab use-after-free in filter_chain
Message-ID: <aqI-8AVfTLxLpXxv@SLSGDTZTAUFIk002>
References: <20260910023106.1795811-3-zafir.taufik@starlabs.sg>
 <20260910024850.6E3351F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910024850.6E3351F000FF@smtp.kernel.org>

On Thu, Sep 10, 2026 at 02:48:49AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Race condition in unregister_trace_uprobe leads to use-after-free (UAF) of trace_uprobe during lockless read accesses.
> --
> 
> commit 04fcafa318e6d04f74e677950139db1dd3bf079c
> Author: Zafir Rasyidi Taufik <zafir.taufik@starlabs.sg>
> 
> tracing: uprobes: Fix slab use-after-free in filter_chain
> 
> This commit addresses a use-after-free in uprobe_mmap. It resolves an issue
> where unregister_trace_uprobe() would fail to unlink the consumer when a
> trace_probe has a sibling event.
> 
> > diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
> > index 861d857adadb3..110ec7b78b3dc 100644
> > --- a/kernel/trace/trace_uprobe.c
> > +++ b/kernel/trace/trace_uprobe.c
> > @@ -408,6 +408,11 @@ static int unregister_trace_uprobe(struct trace_uprobe *tu)
> >  		return ret;
> >  
> >  unreg:
> > +	if (tu->uprobe) {
> > +		uprobe_unregister_nosync(tu->uprobe, &tu->consumer);
> > +		tu->uprobe = NULL;
> > +		uprobe_unregister_sync();
> > +	}
> >  	dyn_event_remove(&tu->devent);
> >  	trace_probe_unlink(&tu->tp);
> >  	free_trace_uprobe(tu);
> 
> [Severity: Critical]
> This is a pre-existing issue, but does this code leave a window for a
> use-after-free of trace_uprobe during lockless read accesses?
> 
> When a sibling probe exists, this code unlinks and immediately frees the
> trace probe without synchronizing with trace readers via RCU or shared locks.
> 
> For example, when a user queries an attached perf event, it initiates a
> lockless traversal:
> 
> bpf_task_fd_query()
>   bpf_get_perf_event_info()
>     bpf_get_uprobe_info()
>       trace_uprobe_primary_from_call()
> 
> This accesses the trace probe structure without acquiring event_mutex or
> trace_event_sem.
> 
> Additionally, even if trace_event_sem is held for read, such as during
> print_uprobe_event(), unregister_trace_uprobe() bypasses taking
> trace_event_sem for write when unregistering a sibling probe (it skips
> unregister_uprobe_event() and jumps directly to unreg).
> 
> At the same time, if unregister_trace_uprobe() is called, it unlinks the
> probe via trace_probe_unlink(). The list removal relies on standard
> list_del_init() instead of list_del_rcu(), allowing concurrent lockless
> readers to traverse into soon-to-be-freed nodes when free_trace_uprobe(tu)
> is called immediately after.
> 
> Could this lead to memory corruption when readers access the freed probe?

I will investigate furthur regarding this. If it's correct I will think
of a patch and send it separately.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260910023106.1795811-3-zafir.taufik@starlabs.sg?part=1
