Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792854649;
	b=D3mZnK9YVVdnnZCNf64FuS+3/+WW7SIT3RWNAbPBzE+hW51zRsZu6h9a7WmASQACzo65
	 8KWMI4N//lN52BECVC+pFCaiikGSCIZ+slTrACDgunGF3AbJGL9v0tWluCB+j5I+dmXuf
	 AYQN5rhqJ8nAnZi4ghITib+m9fkQNjovk4agmPrhDwcpOeVf/Q6Dqapvu3hDUldiFTlht
	 qcozA44leZSz57tLrtXAKlXeuPqLF7OHaavFNr2+Dh4WRsb/Pd84IBnOgqbi23r5JIpe7
	 WXjA4jofhhHKamgK7FYoUuam1wnysT0ag1FQkc3H0U2V7narLHHvtveFFLNyaZzBgyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uf9PXkRYvY5lIL6bNTa4Yzjo7yt0Q40iND7ldsiuGxA=;
	b=CbrAH3Pt2mC8Wh8pa+ue9C/UX8NJYNburqujGCsH6haMqIRT9m95/iXhJFFt4kMbmAzv
	 ZfnCz0yHEKBLaJLxIEtUOQfLwb5/NYgoUkRW3ckfhq+fHPVdvf/0zoa24/ONi+6OWCs6n
	 Rwx/ntcyW6NPGJYpT5kvOtFO7S1RqBP//P+Dy88K4q52od9t9Q+OX2m4Mh4/jf4pPmYq3
	 Hop5SSkL31Hju7BRfgN10/rUMvK8PsClWqwAqmhhSWbuX2AaYxGWZKnfAJv/4LVcGnqSA
	 vFN4Px2kd5x3Wv2Ns8kLlHfrmfySpLNL2D36HcDn4i+vGmdv62619eW5ACLk4Hm97Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Drgzb9Rc;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F4606A31B
	for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 15:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 594F4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Drgzb9Rc
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5363c8de563so17271741cf.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 08:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792854648; x=1793459448; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uf9PXkRYvY5lIL6bNTa4Yzjo7yt0Q40iND7ldsiuGxA=;
        b=Drgzb9RciH9NcPmPvvhcDVGaxwa3gjvwO4xtTOGbyKRQPB637qh9fA5BYLT2D1Z5iM
         z0pa79v1danD5Qp+WtlfEb2LwrCmbpFy4NclLMWIGarQhXxNYMoh8ZWE9i8ZOTGDPaxl
         yEnCTCgjaZy1cMtCAyZc8pJ7oPijh2v3vShhz1QlKXzX6NEmhLgWRsBnlbzI8G9nN9mb
         FJCQ9hYxV/ai2uT89riaVUaAjXzAz9Lsls2xEettyuXPMeT0KkdZ9LOxS8kcotDm17cr
         jBtStEDZJe9Dp6L0ySgDT4496y3f2wbNzpKpeENIcrzyqLgpq1MxsUlvudYI2oXCy70J
         IZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792854648; x=1793459448;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uf9PXkRYvY5lIL6bNTa4Yzjo7yt0Q40iND7ldsiuGxA=;
        b=SisTZPgBvWnwOB4m/9CyWCjXTQnUxJJxit2kS983Wd/teYn8urGlry1txqdz5igIW5
         l6WDxg8d4P50EZf47m3GOH4E8u2DqKtkzKYsiNjB+P6oIunnElsJIRvm1HRjRbR+oHv4
         L/YrM94WOzgpweU3xWSWVpvYKbgSqQUX4dzOFFZ7lwUukghSOoZLeeseA5ac3jfhmrIe
         RbdIoCsVIowrVaFm9h2kcojcxsy233gpvWv57Glh44ePiiumQu7z/dQQNzhvogVT8UCh
         U4xsiSLLZBzNzn6Izo79L5JI62iPrfXZJoMo7oOWJdtnJpvADvr43EkQ6hFzH8hIgch2
         JjlQ==
X-Gm-Message-State: AFq9FYIL+xhG4VuyDr6xRDnUCBD/loJy4n/a9/bpw7D7TfCF8KzG+DyP
	rQ1OddvGmmhVYrBTeZM6Vbl75ndNrFFYKQKPYyvSP/1mMpM6hcBsgIOqrZ6WUxrIbJ9V4KlW7S9
	7YW0JuQ==
X-Gm-Gg: AYBFou2HJV0mNJ6Xad3RGBmfPw79lS6Fs/sA3f8H79uF4tjrZdGlLhGOyu0VuCEvLCE
	GpAhw8q+FQBL6fT7iTLh1fI9xWwZ6pwvOxL60iwcd2vuwTuU8DuPexcv/6V2h2uWLNshfba4W0G
	BZwhUeagQcA1sp39HYEZNQyKUZ6BPpv8tMSORw/C7L1QYdNlpWD04pkghuxdlX0BOta0u47PKq5
	Za9T0CqNarnM875RPJogB7I4UArFCcrbe+Pub6vyAPXsgMgr4GVAleadSoLJIGBmHwFwn0kuiI3
	9BbxFlIRfZ1vsB4S4axCl8DgTEK5nHQBFzVAh242G9kUUFpDDDjjUxhFUQtlTySsR4rBgo1mbzT
	Zk8x94O7oxe6gFWkEftFGlBD6ygD1xo6buRSt84i858spu2O9D7jN0WEJgZGmFQEcduFzymJhdC
	tEVGLHcWuNQ2Lk4LIeHFDtEYOVgw71r0EG0ZqYJfAs+SzZFQ3aDEOMeiRv94BAa9Izx98VKA6Zz
	hmKvQeZdA/dSn2BLvZa0qIw8C1i//GQntQwHv9C/4ShYPK9I+sTJ1pK
X-Received: by 2002:ac8:5acd:0:b0:535:162c:2e85 with SMTP id d75a77b69052e-5383b353beamr27733841cf.10.1792854648097;
        Sat, 24 Oct 2026 08:10:48 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970b678sm17189781cf.21.2026.10.24.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:10:47 -0700 (PDT)
Date: Sat, 24 Oct 2026 11:10:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: sashiko-reviews@lists.linux.dev
Cc: Igor Putko <igorpetindev@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: hcd: flush giveback work on stop
Message-ID: <47728b9e-c35e-4964-8c90-5bc29a2ab045@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024083647.2599-1-igorpetindev@gmail.com>
 <sashiko-outbox-183606@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-183606@kernel.org>

On Sat, Oct 24, 2026 at 09:11:11AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] usb: core: hcd: incomplete bh work flush in usb_stop_hcd() on self-requeue
> --
> 
> commit 9c9e1488a3b8b0e4cd42d6243a942c8d42aeb233
> Author: Igor Putko <igorpetindev@gmail.com>
> 
> usb: core: hcd: flush giveback work on stop
> 
> This commit adds flush_work() calls on the high and low priority BH work
> items in usb_stop_hcd() to prevent a use-after-free on struct usb_hcd when
> usb_giveback_urb_bh() is still executing as the HCD is stopped and freed.
> 
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index a865a15ea3863..9db0f39896065 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -2788,6 +2788,9 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
> >  	/* In case the HCD restarted the timer, stop it again. */
> >  	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
> >  	timer_delete_sync(&hcd->rh_timer);
> > +
> > +	flush_work(&hcd->high_prio_bh.bh);
> > +	flush_work(&hcd->low_prio_bh.bh);
> 
> [Severity: Critical]
> Is a single flush_work() call on each BH work item sufficient to drain all
> pending givebacks if usb_giveback_urb_bh() requeues itself?

That's not an issue in this case.  By the time usb_stop_hcd() runs, the 
two giveback queues should be entirely empty and there should be no more 
devices remaining on the USB bus creating new entries to add to the 
queues.

However, it would be worthwhile to add a sentence to the kerneldoc for 
usb_stop_hcd() explaining this fact.

> Also, does the comment above usb_stop_hcd() in usb_remove_hcd() stating that
> flush_work() isn't needed there need to be updated?

Yes, that comment should be removed.  In its place, add a comment to 
usb_stop_hcd() explaining that even though all URBs have been given 
back, the work routine itself may still be finishing up and accessing 
the usb_hcd structure; that's why the work items need to be flushed.

Alan Stern
