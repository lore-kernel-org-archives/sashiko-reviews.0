Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465942;
	b=SOh2hOI1p66VOewXx9EoA3i6qRtugRFKN8sGtYz0raLVVJsqE7VlesAqqsa6Q3oCQ7PG
	 Q/s+lHRS/BTwam6zkh+EMwouy0Z+LpsoRnip0mYrdKl2KmTC9NLkymx+O1MG6QFjZYBqS
	 skH2KvHnjVriyzd4LPTiUwfsQK4mMNe9HarETKbPDgoI3iGUlTy87O/UhZXQcvXhgIqNm
	 +Lm4l123VHJ04xUpOXcvX/dFlbSRFAYhXDiYVaBLPH2stJ/FPwcMt0b5LIEVWrYp+Dj7t
	 4WhFcAbqJpAQOxTo9Uk/niEz3xesRgtrxuUIxmiHuHNa+Ma7YewxBpwJ1DDVEjupyfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465942;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Scanned-By:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=zKxrjart6ynP+rGIOanm7JgPrwjRI/hWTjEgjmSJj8s=;
	b=12A7cvXEiK/Sxe0t6wgU82T0bTfEJAbXWfj+eDaNsU+MGwmnqWaRPiRPXGabO+q2i824
	 kV4m+YjdmrYVtLRnGU2nPFgqAyNb56EUZ+8G9d+J8qiYfPRAZ2PIemzG3hE3ovHW2/aEE
	 yC4rbUkQFvbPCv5jhKEUi8P8A6VXQUge8EfGAvagchCS34WVxQJtDxJmywFwyWflj6fmy
	 WcRE+vGgAseFkqQ8asDxp5bPJFaQ2HJU6P8PSftDZJFYuPjqeKnAVLZFFsnY03xUjPREm
	 uAAE+Z7t6yPpmnGVjH1UxJfl2olKJxXf9h8WZbNypw9UBfQmAGTvNJRccqfjztHvDFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CdOuN1np;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D714606A337
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 20:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D714606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CdOuN1np
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795465940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKxrjart6ynP+rGIOanm7JgPrwjRI/hWTjEgjmSJj8s=;
	b=CdOuN1npBweGEVu/TQLm2F3xbieCphbvYFPQSwVMTGjP/CeppPTWxLVLAMVm8FaQNfe5R6
	DvY5CyH6xF47gIkH/M4LakiHT2pTKVfqEzL8Vne8IPxzewV/FbuvY28FO9VAgbyRKmcYVF
	sxGWaY/8gGoQ5sAgDly4r9smiFtp15Q=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-57-1i8VDQbDPNSuk4OmJ7_4WQ-1; Mon,
 23 Nov 2026 20:32:14 +0000
X-MC-Unique: 1i8VDQbDPNSuk4OmJ7_4WQ-1
X-Mimecast-MFC-AGG-ID: 1i8VDQbDPNSuk4OmJ7_4WQ_1795465933
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2D30180060C;
	Mon, 23 Nov 2026 20:32:11 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (bmarzins-01.fast.eng.rdu2.dc.redhat.com [10.6.23.12])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 013C11800548;
	Mon, 23 Nov 2026 20:32:10 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.17.1) with ESMTPS id 6ANKW93K3446108
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 15:32:09 -0500
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.18.1/Submit) id 6ANKW5VN3446086;
	Mon, 23 Nov 2026 15:32:05 -0500
Date: Mon, 23 Nov 2026 15:32:05 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
        "Martin K . Petersen" <mkp@kernel.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Mike Snitzer <snitzer@kernel.org>, dm-devel@lists.linux.dev
Subject: Re: [PATCH v2 RESEND] block: stack max_hw_discard_sectors on bottom
 max_discard_sectors
Message-ID: <awSixRC9HeRiGQvJ@redhat.com>
References: <20261123193000.3419445-1-bmarzins@redhat.com>
 <sashiko-outbox-229949@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-229949@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bqke37pcAZre3kSya5x6XmJ3dygrw7d5E1xN33ydayg_1795465933
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 07:41:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dm: set_discard_limits() copies underlying
>   max_hw_discard_sectors
> --
> 
> commit 54b96a4a0a953173383ea0e1a1b7ffcb363bc984
> Author: Benjamin Marzinski <bmarzins@redhat.com>
> 
> block: stack max_hw_discard_sectors on bottom max_discard_sectors
> 
> This commit stacks the upper device's max_hw_discard_sectors from the
> bottom device's max_discard_sectors in blk_stack_limits() and updates
> dm_calculate_queue_limits() to copy each target's max_hw_discard_sectors
> into max_discard_sectors before stacking it into the table limits.
> 
> > diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> > index 48f25ab6b7fa6..4cabe26450941 100644
> > --- a/drivers/md/dm-table.c
> > +++ b/drivers/md/dm-table.c
> > @@ -1834,8 +1834,11 @@ int dm_calculate_queue_limits(struct dm_table *t,
> >  combine_limits:
> >  		/*
> >  		 * Merge this target's queue limits into the overall limits
> > -		 * for the table.
> > +		 * for the table. In blk_stack_limits() the upper device's
> > +		 * max_hw_discard_sectors is based on the lower device's
> > +		 * max_discard_sectors, so copy this value over first.
> >  		 */
> > +		ti_limits.max_discard_sectors = ti_limits.max_hw_discard_sectors;
> >  		if (blk_stack_limits(limits, &ti_limits, 0) < 0)
> >  			DMWARN("%s: adding target device (start sect %llu len %llu) "
> >  			       "caused an alignment inconsistency",
> 
> [Severity: Medium]
> Should set_discard_limits() in dm-cache and dm-clone also use the
> underlying device's max_discard_sectors instead of max_hw_discard_sectors?

This is a valid issue, but fixing dm-cache and dm-clone is not dependent
on this patch, and that fix should go in through linux-dm instead of
linux-block, like this patch. I have already sent a separate patch to
dm-devel to fix dm-cache and dm-clone.

https://lore.kernel.org/all/20261123053235.3060754-1-bmarzins@redhat.com/

-Ben
 
> When discard passdown is enabled, cache_io_hints() and clone_io_hints()
> call set_discard_limits() to replace the target's stacked discard limits
> with those of the origin or destination device alone:
> 
> drivers/md/dm-cache-target.c:set_discard_limits() {
>     ...
> 	limits->max_hw_discard_sectors = origin_limits->max_hw_discard_sectors;
> 	limits->discard_granularity = origin_limits->discard_granularity;
> 	limits->discard_alignment = origin_limits->discard_alignment;
> }
> 
> drivers/md/dm-clone-target.c:set_discard_limits() {
>     ...
> 	limits->max_hw_discard_sectors = dest_limits->max_hw_discard_sectors;
> 	limits->discard_granularity = dest_limits->discard_granularity;
> 	limits->discard_alignment = dest_limits->discard_alignment;
> 	limits->max_discard_segments = dest_limits->max_discard_segments;
> }
> 
> Copying ti_limits.max_hw_discard_sectors into ti_limits.max_discard_sectors
> at combine_limits propagates origin_limits->max_hw_discard_sectors (or
> dest_limits->max_hw_discard_sectors) into the table limits, bypassing any
> smaller max_discard_sectors configured on the origin or destination device.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261123193000.3419445-1-bmarzins@redhat.com?part=1

