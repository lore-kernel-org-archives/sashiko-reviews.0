Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F09E2EACEF
	for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 18:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534578; cv=none; b=kxeFP5QvTNo6m9WFmuBnpTPRh0BRZGKHJM2AmVWOxXuJTvxSPIaYXV+ct8ksdjcFHMz93omuVgqW289S99dl6TsfJDUUwSbnkN4ynCo79tH0RPKTceTpMX/XvH5j+O1x8fZhkK3fGcj2CmU1MhtyeoHgNkasUnWr4IkD5bdeK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534578; c=relaxed/simple;
	bh=IvBSsiok5l2mdD1ruX2x+xVbINUOoZs83THQWT3Mh7k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyuyJpUwQVBLixcFVQcAMy/SkFlcVsWmYBuiGSyAwaCSVlMtvWg3TnI5D3iuYLB1jZcfPL/JjWqQHok7VJjOF+20d6+JdFIK2swAlF+j+pO5eMyuhAGipU+zwp/TyxD2NMMT3xMPgnrr2C5bqo2a4pFg1X39Xxw+209Is5cYZ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HW4tcGYK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HW4tcGYK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so12362115e9.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 11:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790534575; x=1791139375; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Igg1cuL8NxeNzJK0kzGFfe5Gh41dPlsgfg8BZ76N6uM=;
        b=HW4tcGYKyuVxWtnen2OCyQtungVY1YoMKoEs/1NrAEMMpqVV5UGcP4nTBa9JBOMfDB
         Zy/3P57rB4VB57uJNJQvTrPTpxGqgsXNMKO3ucl1tby1Nqxqr0Lq+hNHp9sVgsEqKrAv
         Uj/bDVjMTIR9lSJG6Pv9oMwuNITemlbOeAWILjTW77rO7j72Bb5PHgaerWf/2ld0NzJc
         Zl1p4no23JEH1YYKi5HyTfl28DgW14KQK+rTP/MbLwDHhJn/pt970scEgrBQICc9cvNh
         dDEeLCeUfv0GmR4D0SWpESTRZLIBgQ/jlsl0kdvozPLmDxGA6bVrKMQIaUsVUTpG1cI9
         zd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790534575; x=1791139375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Igg1cuL8NxeNzJK0kzGFfe5Gh41dPlsgfg8BZ76N6uM=;
        b=S4d6a30bWyUPqcyakWhm7hLwbs/TWGt6/mQwAnPrvq/vTlV5iUzvlVAePJ82V51d+a
         iAnIsOEcg5dCDVCtDbNEtNR0ibWrJDA4QHKO+vqDZiJn0HhhCunS8vjQ/PpM4SXSqccX
         fiukZrbNZj8rK86tHqqpV6B/092gODVYgcAn+ckAL+tl/hbQb9ezfCGA3mdBx7NJ/I4P
         7zNOUFdE9YOMDKNcfSSzncDQTe/IAHjfRqi3XsMYfTFTXT4mA6ZKjzyyZsXLnxAp+KbJ
         FQIrAn4nkEMvpg/VmJgxpm3Dxtb6G5CM2tRaFKwQJwXYM0S3KA+rGjkueEbi8CLFdfwd
         vLvA==
X-Gm-Message-State: AFuF++kT6DBHoTTKqFqwVn1rVXZEeCOQjF7aRSfAr12arbyWohrYGPM3
	OawrpSKGvvlXE+puxHtdEY2LXm3VHEGr1GyfAjkaiXdZMz2b3HCqx4yR9Qw6SQ==
X-Gm-Gg: AYBFou0LSJ/Jpf9/I2qLDPRai6ozFg8bPl2v+B0JY40lV7/HzE0qPheXzUnQD+htyzm
	D2qOrrg108pSc8K+5twtpPG/AP3Ffyya9ewKE/1De7L8jN828fSrwFYiMytGdaAEWd1Vrk9mEdb
	BauSKAAapCUy5rJDlJBRu7I4t4QnzhokvcKIbEfu+Fa3eqx03MNStoKaPKhmMxptXKrVghm86uc
	2ttH0nPBCPRjVDrjHPa1pMZSsrh2KCBJ4SDZg91+z6L3vQ4lGd32MP2ndJr0xNhMmNzECPVFuuN
	N6YRHdhEYrUgoSnG/Xl9E+w6rdiQCWY1f/dgtrAHSVLNp8OHsNxF1krapv5MX7wMXISIHMUhsus
	NMrDhUWhYOUeDUOglZkzPkfICCXJACb+rHG0nAayqqHwDCfHn4c+YWRqrhAkPNX5QBcbNPbdMwN
	5x5f4YRbX+ZHXGOuJRXaes7js0x2rAx6WH1HyWKIpRUj7jiffzPkSLjKhmZu4IHa8Y0WgCGXBBY
	u1//gVS/aULX8+X62vZuaZtm0lGPzkw4fhSYDlpFnuuCK3g4y1sSZJlL4t6aNwr
X-Received: by 2002:a05:600c:a15:b0:49e:7c7e:274c with SMTP id 5b1f17b1804b1-49ff06bdedamr131640255e9.14.1790534575353;
        Sun, 27 Sep 2026 11:42:55 -0700 (PDT)
Received: from home-desktop (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349fa1sm31751677f8f.8.2026.09.27.11.42.54
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:42:54 -0700 (PDT)
Date: Sun, 27 Sep 2026 20:42:53 +0200
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v4 5/5] misc: Add edu_srpoc surprise removal POC
 driver
Message-ID: <arljrdE2Hng3Pv_q@home-desktop>
References: <20260927182017.938565-1-abhinjoses@gmail.com>
 <20260927182017.938565-6-abhinjoses@gmail.com>
 <20260927182754.99C821F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927182754.99C821F000FF@smtp.kernel.org>

On Sun, Sep 27, 2026 at 06:27:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] misc: edu_srpoc: lost disconnect_work completion causes remove() deadlock
> --
>
> commit bc425826c0abe82189b4fc145666a7bddb680acf
> Author: Abhin Parekadan Jose <abhinjoses@gmail.com>
>
> misc: Add edu_srpoc surprise removal POC driver
>
> A test driver for the QEMU edu device that reproduces a surprise removal hang.
> It blocks in remove() until a delayed interrupt arrives or the device is
> surprise removed and its disconnect work runs.
>
> Link: https://lore.kernel.org/all/20260905183905.997833-4-abhinjoses@gmail.com/
> Link: https://lore.kernel.org/all/20260905185027.291191F00A3A@smtp.kernel.org/
> Link: https://lore.kernel.org/all/20260927175203.928270-6-abhinjoses@gmail.com/
> Link: https://lore.kernel.org/all/20260927175937.E006F1F00893@smtp.kernel.org/
>
> > diff --git a/drivers/misc/edu_srpoc.c b/drivers/misc/edu_srpoc.c
> > new file mode 100644
> > index 0000000000000..1f395b2c31ee3
> > --- /dev/null
> > +++ b/drivers/misc/edu_srpoc.c
>
> [ ... ]
>
> > +static void edu_remove(struct pci_dev *pdev)
> > +{
> > +	struct edu_dev *edu = pci_get_drvdata(pdev);
> > +
> > +	reinit_completion(&edu->irq_done);
>
> [Severity: Medium]
> Can this cause a deadlock if the device is surprise-removed before
> edu_remove() starts executing?
>
> If the PCI core schedules and executes edu_disconnect() first, it clears the
> disconnect_work_enable flag and signals complete() on edu->irq_done:
>
> drivers/misc/edu_srpoc.c:edu_disconnect() {
>     ...
> 	if (!pci_test_and_clear_disconnect_enable(pdev))
> 		return;
>     ...
> 	complete(&edu->irq_done);
> }
>
> When edu_remove() then runs, it unconditionally calls reinit_completion(),
> which wipes out the unblock signal from edu_disconnect(). Because the
> disconnect flag was already cleared, edu_disconnect() will not run again.
>
> > +	iowrite32(EDU_STATUS_IRQFACT, edu->regs + EDU_REG_STATUS);
> > +	iowrite32(600000, edu->regs + EDU_REG_DELAYED_IRQ);
> > +
> > +	dev_info(&pdev->dev, "Waiting for IRQ in remove()\n");
> > +	wait_for_completion(&edu->irq_done);
>
> Since the device is gone and no hardware interrupts will arrive, will
> wait_for_completion() block indefinitely here, defeating the test driver's
> stated purpose of unblocking on surprise removal?
>

This driver is only meant to reproduce the two use cases in the
cover letter, where remove() is already blocked when the device is
surprise removed. It is not a complete driver and is not intended to be
merged, so corner cases like this one are not handled.

