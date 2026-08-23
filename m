Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1491A6836
	for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 20:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787515754; cv=none; b=CuaOKfZxOWceJJC8K6zSjGUOV3MjbdrZA+Ti0Lw66n2uoqlRnhYCUk655ciwTXbw8kAUR7494EKAoTczPFShKmB70QdCknrlAtANqXmG4mdHqTFCiWR7ijStv987A0HDBqXtS4kiaN011484k9P8ZP8MYpzfaAeIt94Q9MW+los=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787515754; c=relaxed/simple;
	bh=5JJguNi60BYfFeAY3XZIzmSM/Fm13LC2qSz3Q/xD02k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TF4zFDLsDoFc7Yl1BpL90rLDQ9n2vr9CL382eH+7LZqhOSOc8AfpL2ixE7/df21hWpPf4ZV8SHmBsoOL/SdG0/TGWthTEcGnezA4GhqgigiXggQI1piMolacsfe/5aRBGUU4t1vMIuFuCjVSx6csmriCJIrKpgyP5VRqlC1jmSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kGRr40mr; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kGRr40mr"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f6609c657so1144210f8f.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787515751; x=1788120551; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DQ1pHRJnyAKgX9nD7lusA/x7XVWjax+ECExfQRR5q+0=;
        b=kGRr40mr1rSJljR8GYKVLH52jmatXAdHDwoUfxjEfMy6ZK6VKGdtH3HXtAXtkA56IY
         DDbdxvk9JnRCgYou/Mma3+y+yEDtLXvNLh2gvsZfHu71a39g/wVoegJRJ6+25aA2+JV9
         50Wcb+GxQdjjud6FAyhSR2iT16r3oZjVtaHZJFZxVmvv1SuQG1bSKoJPg5BGdl5Dmrxb
         bx2qKTFGmhYbc7uIBSTytf6g+h2JkEHUC5HAqJTQDUWNbUntPt4zSR6CkIgnOQidEUa8
         r4EA7I5mjuZp0kQqCPvH3ha38YBtdMgqcvJefymr+1Snd/nwcptS1uHd0Ax1YPnV3Qc0
         p6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787515751; x=1788120551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQ1pHRJnyAKgX9nD7lusA/x7XVWjax+ECExfQRR5q+0=;
        b=cn4g7ybLBFMFvJvLlj5ZOp2yxICqMmhOAC7ffENRtCFHIr+xq0fVK9lGCwlPphaQeB
         Vtml3dSUb+ZQICAFXFn9kPSUtYwxaviUg2grEPztjuyBDudEf3p0fsjAK26o8Gf52nER
         1VZdv50jxkYYlnq6i0INnzOQG8NN/Sym9y1gJywB2xrdgEJgQEsVkaJTSYvhSjkVPcBt
         /lNg3uby5UO/9McdUgk4tKeoiDL/OLufMebIO06Gxh8SbovwJ+umawSJpVzj0slbwUnn
         ssCyG40UMeMjScNdzWVQcvWh+PqCabKebqU3DQ+pGs+rQ0mnBK+11XWBtD1Ez5ix65dL
         Wf9Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro5kxzhkfDedhiOJohvTiQ4EiKKcGOGhJEXuicBT3vs73wFqazVJjK88kJAeusq4rk7ZvlIfRQ5usIht9OhcVs=@lists.linux.dev
X-Gm-Message-State: AFuF++mxjglvE4T1NQE+xTjKsXlXcSqKY/qG5kuBka3CNao/IBdDhpG2
	cDYiPl4UKmceHHkkf+xnUs+GzkqncXZ2hyYqZumLHrXkcIMi0eC3KF3OwTDZEv0CJw==
X-Gm-Gg: AR+sD115cNoDbajOB65yYcVWBfhFtz8QBA6cn1XKedlk+5TwLA6wNIK3EsSZi9+tUi0
	NrCxLBUBCO1IPBnbnwvmeLqY403/XptXDtvJXFAYXgDEzfaYLfG8k9LUWDNt9/tAglFfAuufKJz
	xLRGqm2viySuoTV1AjlwywNyMG5u9eXWK/e7/5BCWE1rEtA/ljU6d+U5a1Epp+32+UuniuQT/1+
	PP81GA/pDWOGs2He/NbWPR+e5uqzrjRY6rRGeJS1dkww1oWsrmY5qP+wyR872Q9LuP3ZtkkgbDv
	viXE01+TJd99K7bz86wVvDp4tmTOvrEyYBgu2+5yRm/DkY4Bmu2AuydVC61fYmuqzsnkus0dH2y
	v5sP4ljQi29RMPK3xX1tSrXp0gI0OYNjYH6nDOBNFLxnKgxycvjPMOKoxb0/ue2oBWmkuj2trwO
	ZyC9O77xRL3nvSZC8QaUvSWO/IUbm2o52Z0yaIOe7ANkUKCsryhNl+4wWaOo9k085D+iJcJTkFv
	7UnCskkqNn7u8ZOw2xYYN/5qx6dwC4q
X-Received: by 2002:a05:6000:310f:b0:47f:f4b9:88b7 with SMTP id ffacd0b85a97d-482c0b58818mr25873682f8f.1.1787515750301;
        Sun, 23 Aug 2026 13:09:10 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfc383sm5796131f8f.23.2026.08.23.13.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 13:09:08 -0700 (PDT)
Date: Sun, 23 Aug 2026 21:09:05 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] tracing: Fix subbuf resize races with
 trace_pipe_raw readers
Message-ID: <aotTYT0zE5LNik06@google.com>
References: <20260817134750.3909384-1-vdonnefort@google.com>
 <20260817134750.3909384-2-vdonnefort@google.com>
 <20260817140812.2C7D41F00A3A@smtp.kernel.org>
 <20260822110424.346fa3c8@fedora>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822110424.346fa3c8@fedora>

On Sat, Aug 22, 2026 at 11:04:24AM -0400, Steven Rostedt wrote:
> On Mon, 17 Aug 2026 14:08:11 +0000
> sashiko-bot@kernel.org wrote:
> 
> > > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > > index 395238b2b715c..737922b236d46 100644
> > > --- a/kernel/trace/trace.c
> > > +++ b/kernel/trace/trace.c  
> > [ ... ]
> > > @@ -7128,7 +7116,9 @@ ssize_t tracing_buffers_read(struct file *filp, char __user *ubuf,
> > >  				    iter->cpu_file, 0);
> > >  	trace_access_unlock(iter->cpu_file);
> > >  
> > > -	if (ret < 0) {
> > > +	if (ret == -EAGAIN) {
> > > +		goto again;
> > > +	} else if (ret < 0) {  
> > 
> > [Severity: High]
> > If ring_buffer_read_page() returns -EAGAIN because the subbuffer order was
> > updated but cpu_buffer->reader_page->order hasn't been updated yet, this
> > branches back to the again label.
> > 
> > Since the loop does not yield the CPU or call cond_resched(), could this cause
> > a hard lockup if the reader and the resize thread are on the same CPU?
> 
> Hmm, this looks legit. We should at least have a way to break out if it
> loops too many times.

Can this happen only on !CONFIG_PREEMPT systems?

I can add a cond_resched() here though, I believe that would make sense: if an
order modification is pending, writing is disabled anyway and we are about to
loose the stored events.

Additionally I can reduce the window where buffer::subbuf_order differs from the
reader page order by adding an "order" argument to __rb_allocate_pages() and
only set buffer::subbuf_order later in ring_buffer_subbuf_order_set().

WDYS?

-- 
Vincent

> 
> > 
> > >  		if (trace_empty(iter) && !iter->closed) {
> > >  			if (update_last_data_if_empty(iter->tr))
> > >  				return 0;  
> > [ ... ]
> 
> > > -		ref->page = ring_buffer_alloc_read_page(ref->buffer, iter->cpu_file);
> > > -		if (IS_ERR(ref->page)) {
> > > -			ret = PTR_ERR(ref->page);
> > > -			ref->page = NULL;
> > > +
> > > +new_read_page:
> > > +		ret = ring_buffer_alloc_read_page(ref->buffer, iter->cpu_file, &ref->rpage);
> > > +		if (ret) {
> > >  			kfree(ref);
> > >  			break;
> > >  		}
> > >  		ref->cpu = iter->cpu_file;
> > >  
> > > -		r = ring_buffer_read_page(ref->buffer, ref->page,
> > > -					  len, iter->cpu_file, 1);
> > > +		page_size = ring_buffer_read_page_size(ref->rpage);
> > > +
> > > +		r = -EINVAL;
> > > +		if (IS_ALIGNED(*ppos, page_size) && len >= page_size) {
> > > +			r = ring_buffer_read_page(ref->buffer, ref->rpage, len, iter->cpu_file, 1);
> > > +			if (r == -EAGAIN)
> > > +				goto new_read_page;  
> > 
> > [Severity: High]
> > Similar to the read path above, this catches -EAGAIN and loops back to
> > new_read_page.
> > 
> > Because goto new_read_page executes continuously without releasing
> > trace_access_lock() or yielding the CPU, can this permanently deadlock the
> > system during a resize by preventing the resize thread from acquiring the
> > necessary locks?
> 
> This also looks legit.
> 
> -- Steve
> 
> > 
> > > +		} else if (!i) {
> > > +			/*
> > > +			 * If the first iteration fails this is an invalid userspace input.
> > > +			 * Otherwise, this is because the subbuf order has been modified. Do not
> > > +			 * report an error and finish the read.
> > > +			 */
> > > +			ret = -EINVAL;
> > > +		}  
> > 
> 
