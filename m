Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963435;
	b=r303c21C83H5pnHAlDzjLuFbDIMwd93s5jDuPbCgvl0QtBgs9CFey9kATM+08L4S37vc
	 nK2yDMRHGbeyRNaLnrUPvu+3+pWeJ1i+qOb7mRCR6BqMpp/eW0MFlxx02WaqzXp36rn7P
	 sk0PC4MmtE3XVdGaIM9Du2qG0SiAo04sQtPqrg/jDpGVccnNIoSf4MkRHYfLwsc+dm2ld
	 PTV3wwwOHswCg/rM3+la/v0PN3xT6OV63kIvD/uOVUt36lqCsHF9ArWQXQV48S5F1M5D/
	 kJzmUAj9Kj6fQ5wIovl6OXqXMAoOTNAZKYkYZ2GvMSbEmQ3+85qrEAm3Zh2yqJEPd3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=I4V3zZNRZtAND4sC5JKkRGbHBTz7Q9OCgn45waVu3As=;
	b=H4BKfdWKqxaZdykEHKFqPHu5JWxTf/VrCa+J0/dzTvj7i/PuCSADpgUWxWohXThjBndl
	 bWzM4Et7Eab/PeXNa6MUhAJx6w3WIkIGinXts5L+kC8+F9Ogmus2PQ1+89Del5K2pZQC3
	 OqvZpOBHKHkl1z9wgvHu8IiAp9locm56WsTt7dgj+r0IAaX/FGwAX8cFtFbV8FkIQtuR2
	 jQoHrEwPFyjl6y9H4wCsUU+kqO818v8ijvFse4VL9+AzEhg16SdEYcRWvxJBqO+Y9XruH
	 JUmIWckbdFUym8NJ8+Sl0k0CzCf7rGA9p5s0PVNl3IvuDtBrVtJBPjiSgTsVcrp6i3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EwPcbtQL;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359C2606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 00:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 359C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EwPcbtQL
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso748624eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 16:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794963433; x=1795568233; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I4V3zZNRZtAND4sC5JKkRGbHBTz7Q9OCgn45waVu3As=;
        b=EwPcbtQL29S0WGLjmxJbM1sxUYXvFRdh378y2eBbB/G8YAkedwnxznDMd5BgjIc/TB
         /DCuyf0Vl6iVSxQP1RhnsrtR3Q8CKPnYrDnicA9+rp//owlHe+3W9DUbeLK5wF1Lz0IV
         1+Bk2rFKc1FRq3z2n031D7tEIbW7hwtZNW1lt+IxsaOwFk9qrMZW9uC1H+pD8SzGgWBZ
         ONqzuY+IwvUwUGlulfyLJ453dy7+7CFl5ePVn9ZbEXBSsXHdDnjtlpGnULWjzEzMmYtm
         k/7TK9Mbnmojh/vnQQAuW/KYXkgKJFi3b5cO0WeTHzZVrceFW3ZTrIZGtpRt2E9bjqVr
         Sdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794963433; x=1795568233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I4V3zZNRZtAND4sC5JKkRGbHBTz7Q9OCgn45waVu3As=;
        b=EJIIhVDSb8HkifLgiUX5zbDj0Owvzy+pgGBXVjbGHmYpXlEKcWnr8ME8ahjGWQBvhY
         BKzSKpLaXVG3ko4MDgygR5XfIfkrIGdQ6/Wi/cyP3tqBWEyDfu5HsImbxhAuBq/X8+Pm
         J03GzxuZkVVrOXm9Vo7QnHQTwBFoqCnZ7aZ706LJtILMiUOhayFCyOFakvC/yNPxUx45
         apLs3J/M6psGyOGnDzdrcs0aj8js1aK9/+dHUz5ePpXClJqlYQEb4I2CGLr+rsRbHTMT
         yg4GwdQAGykhgeAm0G4BoKMnU9rqHlPA6ZETaRuANNGDBK7qy+ua+idQMMEP+cLEV5N3
         pPWw==
X-Gm-Message-State: APuU4Z8QQsSGK++L2M/gaOgCrx60kSnrEriKWG1zA3tsIkdRQiyQmDoI
	5/BsCj8zSg2DvYesea5qSfgDDrAKG/+YCXVK9bSGJ6CjcGZo/GvC3BMylEOrhT5d5ZbRKsNVj0l
	6Ita5bA/DzWWSeqzHIPoIigD1OgIVfZ6BLuMhMwh7I0pe69ePCg75XL/D605+IW8Ot99X0RTWcr
	A90tWSaQwE0YiGhn6fJJrBXcapFRoYVXeQ3IaXOePcnVuX4vSUMkrO9HPphS8u2Ew=
X-Gm-Gg: AZFdTZdJSbh7SuIWf83u/v5ellY74wpQgNKz0/RNMVnNeRJgoEYhGubGDm/rKbeXGrc
	lXUFzrsa5HiDisiDKFOplPpr1nkyOdl+dUtP8t9HIG1PcYW2cicNHZKccrNX3ZyBjxDSsX6xCoA
	7sJmRSFXs2YhQvgNmKjPqFf0PBTz3hHv/Qp8Rcaup+b8brDGPljHPIi7jE/beU9ZlIcjSUZvgCJ
	O/jY0qhj68YQld99OiTTBQ0SBVkiAxdoCTBkUokAN9zc2qCnDGRLhsV0eY+0y+rLJ/amoER4s7P
	qsNRnWpcE689t7TM/7xYYN9cClGAK4InHDBWMXtN6Z7mxrqkjFKF1xfNM9vp+qb9Ph39+nuaq2p
	3obP9P66XL4aGwt2ToxvJOqTrZkinS50Nzy71ivou9UdvX5E7/eVFgKHWSeeEffZZD6tqZAaXil
	89KkmptzZh4WQAZUnxeVuBnbCXdTzizgZFA4uAVOd9iuaEb4hHjVSFrYkHuQi5YVmtw2kXLSG3s
	negX4V9HVQhe2h9hDwJ+zUh27VXCQM3o86TPE+eXr9mcRfgTzFIKjAiZB8ZK2ICwT9C6bs+/AJk
	4q+WK19OBKcfmjQx82wsI0fGPizwpN7oLIXmZvoJtSgp6Sg8SGnHAReZgb5aPbfZOnmy9k0=
X-Received: by 2002:a05:7301:428b:b0:36e:b05e:9a74 with SMTP id 5a478bee46e88-3828161a511mr990033eec.30.1794963432641;
        Tue, 17 Nov 2026 16:57:12 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm1732644eec.6.2026.11.17.16.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:57:12 -0800 (PST)
Date: Tue, 17 Nov 2026 16:57:10 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Subject: Re: [PATCH v7 07/17] nvme: Introduce FENCING and FENCED controller
 states
Message-ID: <20261118005710.GF1670230-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-8-mkhalfella@purestorage.com>
 <sashiko-outbox-214110@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-214110@kernel.org>

On Sat 2026-11-14 03:29:31 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] nvme: premature non-mpath I/O failure in
>   nvme_fail_nonready_command()
> - [Medium] nvme: live queues re-enabled in nvme_check_ready() when
>   deleting from FENCING
> --
> 
> commit 78ddca4023a9ef3590c04ed05791d87621f68277
> Author: Mohamed Khalfella <mkhalfella@purestorage.com>
> 
> nvme: Introduce FENCING and FENCED controller states
> 
> This commit adds the NVME_CTRL_FENCING and NVME_CTRL_FENCED controller
> states along with their state machine transitions, readiness checks,
> multipath path availability handling, and sysfs state names.
> 
> > diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> > index 38b27d8db0119..4be3ce2e72a78 100644
> > --- a/drivers/nvme/host/core.c
> > +++ b/drivers/nvme/host/core.c
> 
> [ ... ]
> 
> > @@ -622,6 +641,8 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
> >  		case NVME_CTRL_LIVE:
> >  		case NVME_CTRL_RESETTING:
> >  		case NVME_CTRL_CONNECTING:
> > +		case NVME_CTRL_FENCING:
> > +		case NVME_CTRL_FENCED:
> >  			changed = true;
> >  			fallthrough;
> >  		default:
> 
> [Severity: Medium]
> When a controller in NVME_CTRL_FENCING or NVME_CTRL_FENCED transitions
> to NVME_CTRL_DELETING, can new I/O be dispatched onto its still-live
> queues while nvme_stop_ctrl() waits for fencing to finish?
> 
> While in NVME_CTRL_FENCING, the transport queues remain live and new
> requests are blocked only because __nvme_check_ready() and
> nvme_path_get_state() reject NVME_CTRL_FENCING and NVME_CTRL_FENCED.
> In nvme_do_delete_ctrl(), ctrl->state stays NVME_CTRL_DELETING across
> nvme_stop_ctrl() until nvme_remove_namespaces() sets
> NVME_CTRL_DELETING_NOIO, and both nvme_check_ready() and
> nvme_path_get_state() treat NVME_CTRL_DELETING on a live queue as ready
> and enabled:
> 
> drivers/nvme/host/nvme.h:nvme_check_ready() {
> 	if (likely(state == NVME_CTRL_LIVE))
> 		return true;
> 	if (ctrl->ops->flags & NVME_F_FABRICS && state == NVME_CTRL_DELETING)
> 		return queue_live;
> 	return __nvme_check_ready(ctrl, rq, queue_live, state);
> }
> 
> drivers/nvme/host/multipath.c:nvme_path_get_state() {
> 	if (state != NVME_CTRL_LIVE && state != NVME_CTRL_DELETING)
> 		return NVME_PATH_DISABLED_CTRL_DOWN;
> }
> 
> As a result, deleting a fencing controller re-enables multipath
> selection and allows new requests to be queued to the broken controller
> throughout the fence wait instead of failing over immediately.

Commit ecca390e8056 ("nvme: fix deadlock in disconnect during scan_work
and/or ana_work") allowed IOs during DELETING state. This is not
different from the transition RESETTING -> DELETING.

> 
> > @@ -786,6 +807,8 @@ blk_status_t nvme_fail_nonready_command(struct nvme_ctrl *ctrl,
> >  
> >  	if (state != NVME_CTRL_DELETING_NOIO &&
> >  	    state != NVME_CTRL_DELETING &&
> > +	    state != NVME_CTRL_FENCING &&
> > +	    state != NVME_CTRL_FENCED &&
> >  	    state != NVME_CTRL_DEAD &&
> >  	    !test_bit(NVME_CTRL_FAILFAST_EXPIRED, &ctrl->flags) &&
> >  	    !blk_noretry_request(rq) && !(rq->cmd_flags & REQ_NVME_MPATH))
> 
> [Severity: High]
> Does excluding NVME_CTRL_FENCING and NVME_CTRL_FENCED here cause
> non-multipath I/O to fail immediately with BLK_STS_TRANSPORT during
> fencing?
> 
> Multipath requests (REQ_NVME_MPATH or REQ_FAILFAST_TRANSPORT) already
> bypass the BLK_STS_RESOURCE return via the trailing checks and call
> nvme_host_path_error(rq), so excluding NVME_CTRL_FENCING and
> NVME_CTRL_FENCED here only changes the behavior for normal
> non-multipath requests.  Because the queues are not quiesced during
> NVME_CTRL_FENCING, nvme_host_path_error() -> nvme_complete_rq() ->
> nvme_decide_disposition() returns RETRY, and nvme_retry_req() requeues
> the request with zero delay until nvme_max_retries is exhausted in a
> tight loop, after which __nvme_end_req() logs an uninitialized
> nr->cmd->common.opcode in nvme_log_error() (since nvme_check_ready()
> failed before nvme_setup_cmd()) and fails the I/O to the caller.

[  T189] nvme nvme0: CCR failed, switch to time-based recovery, timeout = 45000ms
[  T185] nvme0n1: Flush(0x0) @ LBA 0, 8 blocks, Host Pathing Error (sct 0x3 / sc 0x70)
[  T185] recoverable transport error, dev nvme0n1, sector 0 op 0x0:(READ) flags 0x800 phys_seg 1 prio class 2


           <...>-200     [005] .....   124.297588: block_bio_queue: 259,0 RS 0 + 8 [dd]
           <...>-200     [005] .....   124.297626: block_getrq: 259,0 RS 0 + 8 [dd]
           <...>-200     [005] .....   124.297628: block_io_start: 259,0 RS 4096 () 0 + 8 be,0,4 [dd]
           <...>-200     [005] .....   124.297637: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]
    kworker/5:1H-185     [005] .....   124.297853: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]
    kworker/5:1H-185     [005] .....   124.297941: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]
    kworker/5:1H-185     [005] .....   124.297970: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]
    kworker/5:1H-185     [005] .....   124.297998: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]
    kworker/5:1H-185     [005] .....   124.298092: block_rq_complete: 259,0 RS () 0 + 8 be,0,4 [-67]
    kworker/5:1H-185     [005] .....   124.298134: block_rq_error: 259,0 RS () 0 + 8 be,0,4 [-67]
    kworker/5:1H-185     [005] .....   124.298194: block_io_done: 259,0 RS 0 () 0 + 0 none,0,0 [kworker/5:1H]


Running with multipath=false reproduced the issue above. Yes, the log
line is not valid because opcode was not set yet. And 5 retries show up
just like noted by sashiko. The issue does not happen if multipath is
enabled, which is the default.



           <...>-203     [000] .....    81.537373: block_bio_queue: 259,0 RS 0 + 8 [dd]
           <...>-203     [000] .....    81.537441: block_getrq: 259,0 RS 0 + 8 [dd]
              dd-203     [000] .....    81.537443: block_io_start: 259,0 RS 4096 () 0 + 8 be,0,4 [dd]
              dd-203     [000] .....    81.537451: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]
              dd-203     [000] .....    81.537466: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]
    kworker/0:1H-190     [000] .....    81.552951: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]
    kworker/0:1H-190     [000] .....    81.572836: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]
    kworker/0:1H-190     [000] .....    81.592993: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]
    kworker/0:1H-190     [000] .....    81.612912: block_rq_requeue: 259,0 RS () 0 + 8 be,0,4 [0]

    kworker/0:1H-190     [000] .....   137.406869: nvme_setup_cmd: nvme0: disk=nvme0n1, qid=8, cmdid=113, nsid=10, flags=0x0, meta=0x0, cmd=(nvme_cmd_read slba=0, len=7, ctrl=0x0, dsmgmt=0, reftag=0)
    kworker/0:1H-190     [000] .....   137.406889: block_rq_issue: 259,0 RS 4096 () 0 + 8 be,0,4 [kworker/0:1H]
    kworker/0:1H-190     [000] .....   137.408240: nvme_complete_rq: nvme0: disk=nvme0n1, qid=8, cmdid=113, res=0x0, retries=0, flags=0x0, status=0x0
    kworker/0:1H-190     [000] .....   137.408297: block_rq_complete: 259,0 RS () 0 + 8 be,0,4 [0]
    kworker/0:1H-190     [000] .....   137.408496: block_io_done: 259,0 RS 0 () 0 + 0 none,0,0 [kworker/0:1H]


Deleting the two lines result in different behavior. queue_rq returns
BLK_STS_RESOURCE and block layer keeps retrying during the entire
fencing window 81 - 137. This is similar to the current behavior in
CONNECTING state. I will drop the hunk to keep the current behavior.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114030454.2836543-1-mkhalfella@purestorage.com?part=7
