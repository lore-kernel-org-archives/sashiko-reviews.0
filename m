Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6845F12F585
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 05:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788673285; cv=none; b=LgvL3KFWB6brJZi5Y87dBRNO9mzQa76gLoPgu8KTQD7f2QS02P6CYZ9Bmll84uh4VUwVAbeIsM5bmnBK6VuiIOHZzObh6BkbQeOpanZrcgsqSQZlns6/gO1TdkbhUG/PbXicuWYuzjXGzTIZIM8K18pVSAaxzLxMA2tXhjXOMEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788673285; c=relaxed/simple;
	bh=njcTAxGayLq7ca27ZzRGM4nGcKmIhptGmEugVmi7YDQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgKVsh30ANgvCa61VYASQeaHQODSPhLWfMYqK56lnq6n84IZOzBszAX+52nw6kUzYlBY6VK/gTAACJhZF6qPwAXsHDulDXyVWrutqo6nQXAMnHozqGtnHu/o6aH6lFnL7tVfKDETWyiNiYz+70D7mriTxUQ47ISQTunl0/0qCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZVzbqIq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZVzbqIq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so32948375e9.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 05 Sep 2026 22:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788673281; x=1789278081; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7hBPOJvKa+YhM0/keTNCOKusu9iDHCBh536cYUJpqw=;
        b=lZVzbqIqmpGp1410MzXe5ricwW5jrtQwbdLKfzE9rIfZndEkGomnoHJusnh1rM4nbZ
         UO2FR61Hg+/82hgiRO7J0P9sSRpko7HGwdBNdY89nYChHvQ7D+5pBstid7ojhZQAo+/F
         WRzSLr87+A+aEbJObZRORU3yllcz7h0TEMO1mTMHErjd0y4AoHSU08ql2eUCDl1iX+M/
         vN+LErjJmrOVvMNxZ1DVh0/FHGtYjtxafx2sxCMYFf6QH48ICg7Lt5eLM/gmU4iwiqo2
         falm2yyqszW+0ix5MXWT30IraDIqA0hvAQyFG7euKHP7HbxBu/yJiY5K3Ppzn/kXbni8
         HEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788673281; x=1789278081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+7hBPOJvKa+YhM0/keTNCOKusu9iDHCBh536cYUJpqw=;
        b=TcpPz21w7tosgt2xkasQG+mBvVo+jkG0ue/CIRJOI0AE3dsLXPjsF99fIUi/B0AC7P
         GZzsnk+LwYRB/kIkDS/H2q7fQjwdAEHSUOZxrJBCU2ZJ5GIdPTbe/B+ubDmBA5G/ILgI
         mt0ZFYzBGDPymkaXOChBjKTudDEqClDCphUBtopT4I/nbeUPUbpQvsE3URwb+xRczhhH
         EmW5QO2wMI6EJBNAfPCUtGLdmfXwJHx2jf1/Lolo5H7RK1iYYopgLJjA9+YcjHXM2V4O
         6WVZqGW5HAlxy9f44yC55bYFp3e+M/mQgasl6qeNGwKvGFiNhapTtVRieJfWcmjGX6HD
         i0RA==
X-Gm-Message-State: AFuF++kcj+qrhwYXYIf2Aw9ntKc94CiQiAsYfVTZusX02m57BgaRpPO4
	fMdESnKKmKvm3yCqGOmPd+29JAFpR1OXgWCty0q7oMa9Ts81OuppZfVUMuUtXg==
X-Gm-Gg: AYBFou2OAfntfIfEJAyKE0EtK43rYPLb2Tj9YHcJXyC1MGTvWdOr30VBEtWsHhYvQEp
	xDoLe05e9M15xKrcQDjLYO/S2XS9LuoY36PgDmjnpY52lX8lJS7HIjp3alkEYZfWQg7bi+qDrA2
	NNhEAywECVlYLDVF/TLTQGm7Jpzcwb0hb4LBIsDeLGvdvRxqMlVxbIX1Vd3xrjJZKCWRmruU+4R
	Elm6F+hMFZtuOqY8SZw1WE46lZBudfpTDt4BKp1ltZ/aPdtekGbgBos98bYqmKgzMcmIqgBdJ7H
	wSx815FrUUYV6UexG3kc61JdSwgaXmjA0a7S+cHgxg5i2hvxpuJBFIbFeg34o39tFO3WnKuhuCP
	PAv4jIZqLkz+enxmmyXsIIp9nG8lcn2I2ztJvuF4NvWZQEyupw07jVEyvEl8zaeUd9C1J6tYxh5
	QGx6mXfxHw/VzQgGEPlg6vrvh7YOwXIB/NuxcgweY04G2qBUmSXOqJ7yMmPrV1aK3jG3Uo9sRKK
	4dsm+iEsD4uZPmaInq2N8aNW1+tPM7A7vmGTlS3ZJOQOVsSCqp+0q/zn4YIE8Oui33EqslbD04a
	V0ksLVPjw3OY
X-Received: by 2002:a05:600c:8b6b:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49cf826be5bmr151336105e9.12.1788673281271;
        Sat, 05 Sep 2026 22:41:21 -0700 (PDT)
Received: from home-linux (dynamic-2a02-3102-44b4-cc00-3af3-abff-fe75-d5da.310.pool.telefonica.de. [2a02:3102:44b4:cc00:3af3:abff:fe75:d5da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm104734475e9.1.2026.09.05.22.41.19
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 22:41:20 -0700 (PDT)
Date: Sun, 6 Sep 2026 07:41:18 +0200
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC 1/3] PCI: Report surprise removal event
Message-ID: <apz8_lyURrO22oQ4@home-linux>
References: <20260905183905.997833-1-abhinjoses@gmail.com>
 <20260905183905.997833-2-abhinjoses@gmail.com>
 <20260905184649.E8F621F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905184649.E8F621F00A3A@smtp.kernel.org>

On Sat, Sep 05, 2026 at 06:46:49PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition between `pci_dev_set_disconnected()` and `pci_clear_disconnect_work()` allows a `work_struct` to be queued after the driver teardown completes, leading to use-after-free or execution of unloaded module code.
> --
> 
> commit 889ac5c66b7f1749706d4c7c756b37926ccf5245
> Author: Michael S. Tsirkin <mst@redhat.com>
> 
> PCI: Report surprise removal event
> 
> This commit introduces a mechanism to report surprise removal events to
> drivers via a work_struct. It allows drivers to initiate disconnect cleanup
> without waiting on device interrupts that will never arrive.
> 
> Link: https://lore.kernel.org/all/fba3d235e38c1c6fcef2a30ed083ad9e25b20fa3.1752094439.git.mst@redhat.com/
> 
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index ba3c3fddddc23..23b1605e783a3 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -805,6 +805,12 @@ static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
> >  	pci_dev_set_io_state(dev, pci_channel_io_perm_failure);
> >  	pci_doe_disconnected(dev);
> >  
> > +	if (READ_ONCE(dev->disconnect_work_enable)) {
> > +		/* Make sure work is up to date. */
> > +		smp_rmb();
> > +		schedule_work(&dev->disconnect_work);
> 
> [Severity: High]
> Does this lockless check introduce a Time-of-Check to Time-of-Use (TOCTOU)
> race window?
> 
> If a thread executing pci_dev_set_disconnected() is preempted right after
> checking READ_ONCE(dev->disconnect_work_enable) but before calling
> schedule_work(), the work might get queued after driver teardown completes.
> 
> If a concurrent driver unbind operation calls pci_clear_disconnect_work(),
> it will set the flag to 0 and call cancel_work_sync(). Since the work is
> not yet queued, cancel_work_sync() would return immediately. The device is
> unbound and can be freed, or the module unloaded. When the preempted thread
> resumes, it enqueues the work_struct which now resides in freed memory,
> potentially causing a Use-After-Free or a crash from executing unmapped
> memory.
> 
> Note: This issue is not resolved by follow-up patches in this series; the
> vulnerable logic is merely moved to schedule_notification_work().
> 

Yes, this is a real possiblity I haven't taken care of. If the overall
approach is otherwise viable, I'll take care of these cases in
the next revision.

> > +	}
> > +
> >  	return 0;
> >  }
> 
> [ ... ]
> 
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index d31a8d107b1ef..06d43f57f5094 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> 
> [ ... ]
> 
> > +static inline void pci_clear_disconnect_work(struct pci_dev *pdev)
> > +{
> > +	WRITE_ONCE(pdev->disconnect_work_enable, 0x0);
> > +
> > +	/* Make sure to stop using work from now on. */
> > +	smp_wmb();
> > +
> > +	cancel_work_sync(&pdev->disconnect_work);
> 
> [Severity: High]
> This teardown function assumes cancel_work_sync() will catch all pending
> work, but can it synchronize with threads that were preempted just before
> calling schedule_work() in pci_dev_set_disconnected()?
> 
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260905183905.997833-1-abhinjoses@gmail.com?part=1
