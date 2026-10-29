Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280838;
	b=oS5alBFsiwaf08uMYZ6TlFLcajKw/Wr1FlupaLrrOa0t0VhdhYLc5bMP/eBLkLCNpxRa
	 c+hP9neQxNQ3Lt2e69/ZwcgQkLgSQv3m2fUw9zlA65ELb98rxFHYlCE6gjIJhuCucABRd
	 l6GFGo9wANQ1QelRaAuZsI8RTbavsRuqzeu4ebH9lNMtRiyFYHRHdzRasqwix0Bv24elL
	 2EITreV9eRTUfgtogO33sUTglzb38LvZ5/DYl6WUYvMF3pD3Wa+9ZlgiIhAJWiHABPQrP
	 XEBKToHsXzaq/Kvk3WrZfsKVDa0HOBTpnYMljhXjPfhs15KoAB/LRNtHoJhnrjkMHww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=F+eNJSMVkwDxJUThG2ULRs96wZbJ07yl55m4EZseYWk=;
	b=WGXW682h9YpPI+8shzuxCna23JCg6dK5FoTtxwLQKSH8+Hcv0DBWjnDFgGEHE0K+MPcq
	 HMDUBP4k+WGg5c0vvSUC/xBxUCWwrFcDLafy2emLc87vFs0xy8G1LG+GE0lrFizAxDWsL
	 PbKjAES1g/gilJ96t4AJy7+dgD5/LoPAnLnlPnP5D7LqRVZUecjtjwg0e4S4rkmULEaA+
	 bUG36Ph07W/gJbM9ORs3CjfO4oN033s4hOmsrbPwfty8tUuuftfZdP4toqlJjmubWSE5h
	 No2qOcbZxn4ELlaQ1ylVYALsfZ4nDQmExqqPgDfui8e4ufZFRVkKvh41ineYAqBxFEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=rrVAei1O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5DB606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 13:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=rrVAei1O
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3fd91337baso359521366b.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 06:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793280836; cv=none;
        d=google.com; s=arc-20260327;
        b=Dxv2fVWTfa+hMwpoS0hNErBMGHvtDo2a6OQYhUlz+zgngHYukuIHAv+/WomC4JpbFW
         /DVxf/889ykqdVYlFRQmoIslbAzcKvOPl7G2bBsSb+hBxS5BWzVrrpMRcnp+xNJ4L3X/
         z3fywkFdlOHjJzfcjKCiSJMo5Y46+3fDZMeTHaJmGQ0YK1u2pcIH2HJFVIQYouN72W8n
         w9y7GHGEZEO3D5KINazv9dEH4gj3tQQ37wmzTECpbSl0heOG3v73w6tVpDksUVIgwmpn
         L16NxudPUyp7IIXhrRPvJFiXVJr+Pp0DfGeBe6jQoGhRIhKGU+VDPwt8WPsoDKXuwlTl
         l0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+eNJSMVkwDxJUThG2ULRs96wZbJ07yl55m4EZseYWk=;
        fh=huDnxIwPSwizRg/jZYfjiXYSqMeoWhcTkCWqAd/e5qM=;
        b=oOIWW3ns4VTSYg3iQpvWNYTTC+lKcwCTmZxxBZJYszViDxe+KUC3dzOfCKTp7n8dcG
         VfelE8NoWDG3yEL6k1iCIWMYuEEEmJFgGkc2hs2D9cTNSW+/Is4cezPNeVn7Pit1zrJu
         WmbvNmMIPyq7yw+AHCIfDdw3T2Btx+DNKBldqVIV3oWMpnHNt1mUPdDx8gM45JFpYFe0
         ePaQqxvnl2bMOg8DPuFH7GmKfGzn4mfNKftjY8T+/mw391rImHNQBECOgCS3ZPlEekFz
         1Wt7cJiu2vg65I1tEToDR7NknrEoAOHhSd1JvfZYhzAA/eZLTvlo4P3+4Zd6d8XvKb58
         6+CQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793280836; x=1793885636; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+eNJSMVkwDxJUThG2ULRs96wZbJ07yl55m4EZseYWk=;
        b=rrVAei1O2wimWk/F0YZk4yTtleAM7PAVW8KoQb4Ish6fSXuy+9/gnvCHf5SNs7npfz
         73inZHIo5FfovBjKOlbgprpx+qJoS1zeAHJ1pqohtMD/kh4zeU+n87sKm9y9IH/1UYQa
         kmPx/+ptQ8L/thiyMl/jsWd7aMUV1m3DqLttqzlv3Z/wvOMGtEu5XdQwRanemKyDY8vh
         yu8Q2noFeZVnXl7s5h2MQnZNdEgcPBcym3RSkD3LkrhlwPfztTWfrQGB2j1DYrbCZlcm
         7N+bjRdV7iMJE52Wyic4i0dNHD12XI6DdizDAVhrEvC2Y71tJT9aXO8sWSrHmVEMZal1
         3+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280836; x=1793885636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+eNJSMVkwDxJUThG2ULRs96wZbJ07yl55m4EZseYWk=;
        b=gGGS4G50Lng5Zyo99L1UxgYys4D/A4+PkMP3MnAkkr7vgzNbV54wzWvr6cTDAQWbVo
         Nt5ARzQPbb/wSrSnwFCylobH8V+rqTciuWIkedJMgzVMzP4Sy56/VvXkP7cwYvL3HxTE
         nb4nYVRoEzSQwrMBHA4/q/ZaMPRYm6KuOQG5wM1iIXgsfwJ0urss0M1X7ohswJJiHYIH
         NEvyd+o8fqiUTTiN12T8ESL/vSH7wwY/Br8RcwP+WLxk00RpZPW+DbClbYbr9cYg+6nI
         Gmk5dEPoZrrzliTQOGNKk9WEsQmE03+5CXwN/WsrpswIUUWMit+pC8Sokz+bPcqMv3fm
         aXQg==
X-Gm-Message-State: AFq9FYJ11N9iy0Mm2rks63ivvLbSw4jHVYdAu/8HN+N+eHypC6Hpvss0
	uM1FqGMzM7nXjTqYTi99/wWpVv8VwOaeeTb6qUQCJKdRNQR1nZ7twXJRsF/HO6hzcyv25QuTn42
	x6uLmZBOop0SFemq7ZkLYOPyFRowYCm/2m7ABs8G/Vfu2/0iGHPxp+72AfQ==
X-Gm-Gg: AYBFou0pBvpc5I2APMk1bnH6BQwQVc9f2pkFIIswKFICWCE+1C3Gf/unA0690JnZBaw
	6fbrVd7U4nFCZH4T/JAhwcqsPJ5YtN7c5J3awUWY7XwQh7Hj/NIYFM0z7TfWUiXqMVc8/wnlUaT
	jaE4TfS/vNXDD9j9ZbyuFlgHbxsjAbbRmsI+8UOrRLCJ+1nykNKPRkWUaWDkPT3X1yX37hd5pMu
	ySV0ovHHaBeL8dmog6c9HyQs0gXy03/i7uzKGKVVA+6OQ6J3rtvAlaxOczojUOnPNcDmUmYCSrr
	2OgwxAgWXhiYFX6E70eKLHO04lxtTvsWYqZ5CHlfytR13LHSk1Q/AhgrJrmaxyWTXq5HgoDmstW
	h7bA24hN2hGnnsBqQOd+B52SPmkxKR83Roo53z0cvmXmP3SsmpblBDExYZr80s4RyL7H1kMvFAS
	izL6Tq2bm9y2cHbI8=
X-Received: by 2002:a17:907:6d29:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c49bdb68d6dmr477795466b.1.1793280836138; Thu, 29 Oct 2026
 06:33:56 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029-biwin-tua-quirk-v2-1-4d71af956ac5@flipper.net> <sashiko-outbox-189185@kernel.org>
In-Reply-To: <sashiko-outbox-189185@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 29 Oct 2026 17:33:42 +0400
X-Gm-Features: AclHuK-InaAZRWkyXXw7fbMZCCfKUR5Fcnop4TxQ9forW4KTFobV-VEqdzfk2_o
Message-ID: <CAKTNdwHeHECQiM=MBew4YE6E0STwPBxyo_QnshASoE7u2z8P1w@mail.gmail.com>
Subject: Re: [PATCH v2] scsi: core: Clear power-on UNIT ATTENTION on BIWIN UFS devices
To: sashiko-reviews@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Bart Van Assche <bvanassche@acm.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
[...]
> [Severity: High]
> Can scsi_test_unit_ready() starve waiting for a request tag when retrying
> writes saturate the queue?
>
> scsi_test_unit_ready() calls scsi_execute_cmd() -> scsi_alloc_request() -=
>
> blk_mq_alloc_request() with flags =3D=3D 0, which waits in blk_mq_get_tag=
() for a
> normal non-reserved tag from bitmap_tags.
>
> When write commands receive a power-on/reset unit attention,
> drivers/scsi/scsi_lib.c:scsi_io_completion_action() requeues them immedia=
tely:
>
>         case ACTION_RETRY:
>                 /* Retry the same command immediately */
>                 __scsi_queue_insert(cmd, SCSI_MLQUEUE_EH_RETRY, false);
>                 break;
>
> In __scsi_queue_insert() -> blk_mq_requeue_request() ->
> __blk_mq_requeue_request() -> blk_mq_put_driver_tag():
>
>         if (rq->tag =3D=3D BLK_MQ_NO_TAG || rq->internal_tag =3D=3D BLK_M=
Q_NO_TAG)
>                 return;
>
>         __blk_mq_put_driver_tag(rq->mq_hctx, rq);
>
> When an I/O scheduler is attached (such as the default mq-deadline on UFS=
,
> where dd_init_sched() sets q->async_depth =3D q->nr_requests so writes ca=
n
> consume all tags in sched_tags->bitmap_tags), __blk_mq_requeue_request()
> releases rq->tag but keeps the scheduler tag (rq->internal_tag) across al=
l
> retries. When no I/O scheduler is configured, blk_mq_limit_depth() impose=
s no
> limit on writes and blk_mq_put_driver_tag() does not release rq->tag on
> requeue because rq->internal_tag =3D=3D BLK_MQ_NO_TAG.
>
> If enough write requests are queued to fill all non-reserved tags across =
a
> reset or runtime resume, won't those writes endlessly fail and requeue wh=
ile
> pinning every tag, blocking scsi_test_unit_ready() in blk_mq_get_tag() un=
til
> a write exceeds the 180s retry window and fails with an I/O error?

Hmm, I've simulated this scenario and it is indeed the case. When a
lot of writes are in-flight at the moment of an injected UFS
error-handler reset, they end up holding every scheduler tag upon
resume, meaning the TUR queues behind them, and the recovery doesn't
happen until after the writes time out with an I/O error (which is
pretty much the original broken behavior this was meant to fix).

Given that, I'm wondering if dealing with this via the UFS devman
interface (as was done in v1) is a better option after all. Bart, what
would you say?

- sd.c looks like a wrong place, because sd never sees resets the UFS
layer does on its own, such as UFS error recovery
- The midlayer (like this version) doesn't seem to work either,
because it only learns about the reset under the host lock, where it
can't issue commands, and queuing them in a process context means they
wait for a tag from the same pool as the offending writes are holding
- The devman path in UFS, on the other hand, knows when UFS does all
of its resets, and has its own reserved tag, so the TUR can go out
inside the reset before LU queues restart (thus no deadlock of the
sorts referenced in edc0596cc04b)

I've run the same test on v1 (TUR through the devman slot): the TUR
went out inside the reset, before ufshcd_err_handler finished, and all
399599 WRITEs in the same window succeeded, with no UNIT ATTENTIONs,
stalls or I/O errors. If we go that way, v3 would be v1 plus setting
lrbp->lun from the request UPIU, as pointed out by Sashiko during the
review of v1.

Best regards,
Alexey
