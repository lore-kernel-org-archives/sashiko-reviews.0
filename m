Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964064;
	b=jNfgOFlc66jBuAA22seuZNhTTYpsZAIGjdd2Qz+6n1Rxn86Tqc+LPCBuRMEtv31GydAA
	 U1OoEFrRGUnfEsQD7Z1i31gsdY45XPYorJ10dkRFYywkpEXcP4wokZjqnkUhGO7W1iRjP
	 tLBFmplB0TRaiLU6WuyYEfuDqcu4BczBdKrPMlDrM6ZmSZ2n3q3DGCKPvpuarMjPx8sav
	 3znYcECXAeDrzCmYkUEE/x1Y6KBJiMY6faK3MfL9J50VbN0zvtS6QgtRUp0k5v+R12mlk
	 ubxX040EF58dtMFR5E3BCOEUc4QJ2GnslM9evbbSBNDErJheZGbjf1LElWebOvSbZTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=NOTwfWT5exRktPS0QbPxTgTynJXt707bQrx96P7lNoM=;
	b=HOdw2q/me8/NKSZtH5p5q7UH57TaG8awy4xXmkrVavdHRNXWEatju2Xqq9xkJPHeE3LU
	 D2pnyrh2DvVdm74wM8QaUaAYiBRHh703LOQk8vmwGcP5cheWEu4flOgtILQeyyaQ/FpRl
	 YoMGrsDLH3mrRNqHJRkTcZj4g3nHA8YdveqN8vtsxj70/s0hJG7e9TYkpxOgMc8VIAFMB
	 vBKQLS47ElBw41L1k9VxZlIwI6QmxWS4srzgcF6N+kbi4WxvsUH99S5qVxXcENOIJw29d
	 ybsGG/W8ae0Xcx0lMVjZ50Rfup2JKBaYZZxxAqQLMF1NgWcGT9ZNElTuoMrHENM7Oaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=FBPmc4Yr;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E25606A32A
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 01:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E25606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=FBPmc4Yr
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a315ed211so287646eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 17:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794964063; x=1795568863; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NOTwfWT5exRktPS0QbPxTgTynJXt707bQrx96P7lNoM=;
        b=FBPmc4YruDu4sio8rdxXV6vclRVpL3o84ycf3QJ0QnkEl5QQxy6En3f+fZUu8AVBMZ
         kqPNnVe3Xdu9IfMOXEnwRvCdi6iPyns+TOb+SH4zKYLQXmIVzZnizTRFo0VQgI6IQqdQ
         ZUWCO5YVdUqtVSnPeHEHnj7J1ENy+7YahA+2ba25DI+X+ZikabNfLps8TBibeZ1FFE5B
         DnnnqUHabhH1rvkULwetj7mI1kxLU8SO76BE6Hp8ck/oyst4rEd/KfIdbf6hrSlyIGqs
         OZ05r8Z43D7O0ggh6m00Qu61o7fhDkEawMTvJ3u/2TWyBzp1+6vjpakFEZkhP+hht7dK
         jnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964063; x=1795568863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NOTwfWT5exRktPS0QbPxTgTynJXt707bQrx96P7lNoM=;
        b=xbu9yXosfXosL0HOqhRE5eHlQpItxczD/jvM++++tABnAjDDRSaWE0NrKlMJNLrSwz
         d2zkwT3A3HKyLJrhRrGzMrkakszEbJv9p/AFRuinTW4FCU12+xtwwLs2fDYdy0Ka8LA6
         Vd2joqqw3p5F7MTRt7nvHryufdlFQZYNWVDBq35C1sXwYcC0cG+Ulk6JiztAP2mVZ2ZE
         yQBbxKP3IbXqLPQ6tl38myiVTfLRoBg24YbWSy9jD54XSX1k5hzM7tADFdTRYVtaqTaN
         NSlI9CrFcXtflBUAfE8JCswmF5wUTkn6OvEhtNR9sew5Zp5dJqlQGwu0hLI6c8u5L5EY
         97hQ==
X-Gm-Message-State: APuU4Z/bN5W9nysV04Jebx29qNC0oUeB/6ABHfZI+Bwf1bnMPF64rBOF
	3//dzSCn8Oy0JTmiaI5Vigkn+qlxCkS3cqVxHCtC3y55VTjYZQMLhTWVewxoGIRNP/UnNrYUhkM
	CDcBIKPNuowt0Pasl6w+f1Lvtfk53Yn6G/XuNqwhJQ0/6gZAL+e8Qw7xEElOA9taoT+ypuVTwem
	BlH0Bho0cKSWHbn1YqTZceP34AHhJhNxnG6otRZftFpocezHEWaioiAnJd88/9RkY=
X-Gm-Gg: AZFdTZeXLc1+oVsfou1oBAa+jgdqofGpkr1YdntwxW+1plL3tohVEXMQ+/TikFCM2j1
	F2kJC0BgRXYUhkaBG3FAYrmzCs687c2E80xJKVIlH+JiW1tHp9MvMXZUZk7yvCjGwyo4wJcDlgd
	Kr2jm+dbiMd0I2S6Ju0unSETtfX5oM+5t4u9d0fsu0GxOwBMUE9DvjSPDcBT6INTMv52dMlfitr
	THlHH8WwKBVQKbeKCfiJA9Up8CAq6C9DOLTZUpXWjHYmSrTmO7asAYd7duiYRo3K2XMFTuZltW9
	bIcSH50T0aTBiYGYgs48MCPUMp8hAVAu0AkwcOTFc8OJUFoCAqkiOSm5N+GfboJX7hKewuzE7LI
	S/ofe51LgthSvXrKKo7IROjDTM3pSrPNmVfDHvej4SEIR4ZCqAelRshXaLbvgwObsNVBqV4zOMT
	3DAau0dqI3s4O2XkTIUffuZ4vahQ+lRHNbMW4jCmqg/wEkNbClqSN5YJSyvYkMVKHM623liFy+E
	nHAM+c0aY+/Yg8f1wiCfBwVuQjwSBUZIKJHWL5eetM+1rWksH5L+8UVM5X/iGCqhYir0/d1CLi5
	v8TdGnVRfYuJHKJz3R0n12AwDwyRyufYHzLGJiTTECg3TiP/pw==
X-Received: by 2002:a05:7300:8283:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3828161e0bfmr957325eec.11.1794964062301;
        Tue, 17 Nov 2026 17:07:42 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm2942951eec.3.2026.11.17.17.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:07:41 -0800 (PST)
Date: Tue, 17 Nov 2026 17:07:40 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Subject: Re: [PATCH v7 08/17] nvme: Implement cross-controller reset recovery
Message-ID: <20261118010740.GG1670230-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-9-mkhalfella@purestorage.com>
 <sashiko-outbox-214105@kernel.org>
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
In-Reply-To: <sashiko-outbox-214105@kernel.org>

On Sat 2026-11-14 03:26:40 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] nvme: nvme_find_ctrl_ccr() skips valid controllers on
>   unsorted list
> --
> 
> commit 5d2164548bbd55a6b77ef7780332ce46368dbeb8
> Author: Mohamed Khalfella <mkhalfella@purestorage.com>
> 
> nvme: Implement cross-controller reset recovery
> 
> This commit adds core cross-controller reset (CCR) recovery logic in
> nvme_fence_ctrl() and nvme_fence_timeout_ms() to terminate in-flight I/Os
> on a failed controller using a healthy controller in the same subsystem.
> 
> > diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> > index 4be3ce2e72a78..27c33dc49175e 100644
> > --- a/drivers/nvme/host/core.c
> > +++ b/drivers/nvme/host/core.c
> > @@ -576,6 +576,157 @@ void nvme_cancel_admin_tagset(struct nvme_ctrl *ctrl)
> >  }
> >  EXPORT_SYMBOL_GPL(nvme_cancel_admin_tagset);
> >  
> > +static struct nvme_ctrl *nvme_find_ctrl_ccr(struct nvme_ctrl *ictrl,
> > +					    u32 min_cntlid)
> > +{
> > +	struct nvme_subsystem *subsys = ictrl->subsys;
> > +	struct nvme_ctrl *ctrl, *sctrl = NULL;
> > +	unsigned long flags;
> > +	int ccr_used;
> > +
> > +	mutex_lock(&nvme_subsystems_lock);
> > +	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry) {
> > +		if (ctrl->cntlid < min_cntlid)
> > +			continue;
> > +
> > +		spin_lock_irqsave(&ctrl->lock, flags);
> > +		if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE) {
> > +			spin_unlock_irqrestore(&ctrl->lock, flags);
> > +			continue;
> > +		}
> > +
> > +		ccr_used = atomic_inc_return(&ctrl->ccr_used);
> > +		if (ccr_used > ctrl->ccrl) {
> > +			atomic_dec(&ctrl->ccr_used);
> > +			spin_unlock_irqrestore(&ctrl->lock, flags);
> > +			continue;
> > +		}
> > +
> > +		/*
> > +		 * We got a good candidate source controller that is locked and
> > +		 * LIVE. However, no guarantee ctrl will not be deleted after
> > +		 * ctrl->lock is released. Get a ref of both ctrl and admin_q
> > +		 * so they do not disappear until we are done with them.
> > +		 */
> > +		WARN_ON_ONCE(!blk_get_queue(ctrl->admin_q));
> > +		nvme_get_ctrl(ctrl);
> > +		spin_unlock_irqrestore(&ctrl->lock, flags);
> > +		sctrl = ctrl;
> > +		break;
> > +	}
> > +	mutex_unlock(&nvme_subsystems_lock);
> > +	return sctrl;
> > +}
> 
> [ ... ]
> 
> > +unsigned long nvme_fence_ctrl(struct nvme_ctrl *ictrl)
> > +{
> > +	unsigned long now, deadline, timeout;
> > +	struct nvme_ctrl *sctrl;
> > +	u32 min_cntlid = 0;
> > +	int ret;
> > +
> > +	timeout = nvme_fence_timeout_ms(ictrl);
> > +	dev_info(ictrl->device, "attempting CCR, timeout %lums\n", timeout);
> > +
> > +	now = jiffies;
> > +	deadline = jiffies + msecs_to_jiffies(timeout);
> > +	while (time_before(now, deadline)) {
> > +		sctrl = nvme_find_ctrl_ccr(ictrl, min_cntlid);
> > +		if (!sctrl) {
> > +			dev_dbg(ictrl->device,
> > +				"failed to find source controller\n");
> > +			return deadline - now;
> > +		}
> > +
> > +		ret = nvme_issue_wait_ccr(sctrl, ictrl, deadline);
> > +		if (!ret) {
> > +			dev_info(ictrl->device, "CCR succeeded using %s\n",
> > +				 dev_name(sctrl->device));
> > +			nvme_put_ctrl_ccr(sctrl);
> > +			return 0;
> > +		}
> > +
> > +		/*
> > +		 * CCR command or CCR operation failed on this path.
> > +		 * Try another path as long as we have time.
> > +		 */
> > +		dev_err(ictrl->device, "CCR failed using %s, ret = %d\n",
> > +			dev_name(sctrl->device), ret);
> > +		min_cntlid = sctrl->cntlid + 1;
> > +		nvme_put_ctrl_ccr(sctrl);
> > +		now = jiffies;
> > +	}
> 
> [Severity: Medium]
> Can nvme_find_ctrl_ccr() skip valid candidate controllers in subsys->ctrls
> when retrying after a failed CCR attempt?
> 
> nvme_init_subsystem() appends controllers to subsys->ctrls with
> list_add_tail(), while nvmf_connect_admin_queue() assigns a new dynamic
> ctrl->cntlid on every connect or reconnect without reordering the list.
> Because nvme_find_ctrl_ccr() stops at the first live controller with
> ctrl->cntlid >= min_cntlid rather than picking the one with the smallest
> matching cntlid, failing on an earlier list entry with a higher cntlid and
> advancing min_cntlid to sctrl->cntlid + 1 skips any later entries in
> subsys->ctrls that have smaller cntlid values, causing nvme_fence_ctrl()
> to give up on CCR early and fall back to time-based recovery.
> 

Yes, I see the issue. subsys->ctrls is not guaranteed to be orderded by
cntlid so it is possible that we miss usable controllers just because we
we already used higher cntlid. I will take a note of this issue and
address it later on.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114030454.2836543-1-mkhalfella@purestorage.com?part=8
