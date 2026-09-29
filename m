Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E0F4EE872
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 23:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790724856; cv=pass; b=T6o0nO+12BQzvO/cS+qJhZ5GNhdTt2A0lMy6dNjPRK0qgi5N4YM3Oy+Ox193BhF2c5DACBc/RKlxJD7X4DFXhAzpQpvNcsPk54Il5h5ecUeuVXuT0aZOqgZM+3c0dDNniMuSlgsKLyqdAGLecec83GIYmrzlsZGN/sQdDokmPoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790724856; c=relaxed/simple;
	bh=ZK96rwVWHevl6QXaV3N/n/+PN+Yw7xHBFu6aCe1zfZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=JX3hyoYhrTXgQ48tJdM9AxHxVcvZ0f7iZfFQ5KUsApwv9fkxnDoUtWhFq83x4vJo06Xpk0FUgkPaZnRsosmceHUWhA5bskIYK/V+SyUHt0r061dQxRFIO1a2xP3tofje2iVuL8gA0vqmFSu2DZYYhFjuBrpejzqP4V3Bk7OJ9jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qofVSVyM; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qofVSVyM"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e1195040aso55366966b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 16:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790724849; cv=none;
        d=google.com; s=arc-20260327;
        b=Ht4RRuHjOs3B4uE6wespilJHHW48pWibC6pI5QuZ7RIABxQ8Ik4d2j53dCQciHD9yS
         Fm1BDLbLPrROaFrjxMZxztvrUs/ws9IZBBDPD/ELdYxGmyeOpjFYynPqDaXbvaXXWVBB
         3mEEtTiuU8jCmASHBpZ5lllkS3lj5NpjTREt6Fe5WU2q5KAbRSoSpLYROEMtQ80XiS0V
         oed6Uj80AQs5agFitJLDm3XqWW+2VcF1mYHZHFoV4XSVaN1zxIY55veOF7okskNqDwSi
         3+Trim4m9I4NNO6xF6Y/KIPt1drh8RDvnGHaqwyeGqRgkwCB8uCZmm96ygaVeaUymsEA
         V5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ks/Bh6j4sEczJt5AST0NLEeQr5yUqNIow0fhaJM/TLs=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=IrEt/MCrliwHn0pHmAtgF3Pqh0Tbbf/mkBYsR5cteGP8nnBbIzR/UFcy7WnGyi6ZvK
         1jHp7R6DdrE4F6SW3wwBcKVDAoANN8JZbdWgLzfa1DB/fDOQbC+orCVElcVHfTUmozz2
         UM8hcU2aDZnkUSxJa+LyTvOAkNw+KTRPDNUy108vr8sb72QCRZIkXXA6b7yDxldLRhCW
         hMihkO4ANVIbjZqD1g+yMUjlBKSbWVVBRAuuKFrE3bwrexlWUb/5rVDtArMMoEdVei72
         leAb0aEKJU/AcR+a7VkkgVUudD+h6ix5WSwF6KBm8W50/ZGK8zZ9/pSFu2Fun2maG+a7
         hmpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790724849; x=1791329649; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ks/Bh6j4sEczJt5AST0NLEeQr5yUqNIow0fhaJM/TLs=;
        b=qofVSVyMqwTNdT9+s6eoKjVnaLH+GfFhtWju1hhqsNahHic4ABQIsjjGcSiaMTR/lV
         aYaQJNcTJSEgnrutsWNbSIVZf6auYPsYaZrdTU4Sovhel78PID4P07hUqVTJU2M8tQ/1
         WqGUnRkmFi3NJVj78UnW3INlDDuybTV3/xpaM5LbjrcZJQyAoDyJ23wDYJQLIt5AK87X
         N4KfQ5HmsHdYsDlH+UIO6ecQPm7wN4wWWeWb+LHUAgv+Effw4BsqI9U/Zp9jWmCsfUKE
         rzDPHqL00x0ok/gGyhVIm8xMSjgJr5FfKS+Ms+HoV3UKFRWwwxSwwzuJvNBsJEoFYjji
         BXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790724849; x=1791329649;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ks/Bh6j4sEczJt5AST0NLEeQr5yUqNIow0fhaJM/TLs=;
        b=wR4vYeH5eyxSGkXeKCLIl/BW4BDlZm+HuFCAJFp/BZk5djJE1QU1/ZYnFAMoljHn4F
         ohB8JPzQ6rWfTdARlMhJ/uRyTBWOTUICg41YPIqBMDF+F1Xz5LQrIefIAK+CYtHyxFDx
         7iKtGx44BSnGO2bWxQZMdg+aF7UhEBk2Hlp3/VO85Yandrw8yn5+xIdR526RuvRnSUDT
         D3XyxcwzK28q+tImcDd7I2XEPxPAoAE3hrmWMVJOpnD/YzmyyB3AR3MZVr3jJCxoxy2Y
         x1emvAL1vXsQJWSwcsmQr6nnsDlUq8QBZoJXLe+12oA4AxDNO6WvERta0JQHRoHe0k/b
         DBlA==
X-Gm-Message-State: AFuF++lBPllXyarFps3u9Jzd4bsvTZRmgiG8RGWpyJM85+ROWKkpJU3X
	+JBX/+mZt+Z4+u6x+/f1LctFZdVLsJ+Ett6B/vQTLksnDouxgJ0ftRFuVjsTDEOImfcm/Alwy9h
	+Y0gjLwKwTYxd0H4f4qkkVcTRX9bY5qQBWl8JUXI=
X-Gm-Gg: AYBFou1CToLCVGojSAHu648TDsxYylMah5kdp25v5ml9T2I+JmUxjpdZLl9gErgTV8v
	3AgGgDVTg5xYsa2LCazPvQtNeXXg0/hbyR05PqYo2eBga5TQPuapHr8zXYavGrttlknm9D+WnQ0
	u0clP1WuCQaP4LjavoYuAyvLzkVdKHcJWUDRapYlppra6S8IT89yg7RBabfJgflUvfqhwv0F0bx
	lyOksMiNAwaPoSYhBJPjWga8e53pfKca3+wEbyiC4agCGM10PkwoBZnEMLZ8jN+mO1GiwFdqEfv
	z8SVWkY/a9gkHpEKH9wcBbI0P83mJSC/H1des7MhxJDCVe04OkKDf7aJ7o65PL7RKbMgOFSmwOO
	V0DxEaz50u+G/3T+AbOTYFCMawchz9ojgfHzlfWWBIm2iLAcsmVeuhywBQWcZjD8zlvqTfxL3OZ
	Z2Sq7mMzldSrQuZiQpI840APgoRGNJvhCy49NexHtWZ4KlLYjKwbA5a0dl0rpKDhd4ttqsw0Ecs
	r4Bn3Xu2254iq/gG8JKEKneaz9TbdxTpHMOcE/cIwlKPLTGNSgitH0/9xVp5ugGNn79ACXPYbDA
	1qZ8haWv
X-Received: by 2002:a17:907:1b1e:b0:c2d:ba65:4ffe with SMTP id
 a640c23a62f3a-c2e157c5a5amr71612366b.24.1790724848947; Tue, 29 Sep 2026
 16:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <arn3qTu_SeM8Yrjj@1wt.eu> <6aba080c.b933486d.297b72.5042@mx.google.com>
 <20260928063742.6CAED1F000FF@smtp.kernel.org>
In-Reply-To: <20260928063742.6CAED1F000FF@smtp.kernel.org>
From: Atharva Vartak <atharva.a.vartak@gmail.com>
Date: Tue, 29 Sep 2026 19:33:57 -0400
X-Gm-Features: AclHuK8qD0YmQt32YOkGthM5TZEjrs_ZxYWQour81x0iH18wqdzwqwqG_bmwm-U
Message-ID: <CAMaGtJaBoNS=P60mSF6-_=hP=7ZV7kj4ArQKeFY9oNCnndb5Fg@mail.gmail.com>
Subject: Re: [PATCH] net/smc: hold a reference on net_device returned by pnet_find_base_ndev()
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

C


On Mon, 28 Sept 2026 at 02:37, <sashiko-bot@kernel.org> wrote:
>
> > pnet_find_base_ndev() resolves the base net_device for stacked devices
> > under RTNL, then drops the lock and returns the raw pointer without
> > taking a reference.  All three callers dereference the pointer after
> > RTNL has been released, creating a use-after-free window if the device
> > is concurrently unregistered.
> >
> > Take dev_hold() before dropping RTNL and add the matching dev_put() in
> > every return path of the three callers:
> >
> >   - smc_pnet_add_eth()
> >   - smc_pnet_find_roce_by_pnetid()
> >   - smc_pnet_find_ism_by_pnetid()
> >
> > Fixes: 0afff91c6f5e ("net/smc: add pnetid support")
> > Fixes: 1619f770589a ("net/smc: add pnetid support for SMC-D and ISM")
> > Cc: "D. Wythe" <alibuda@linux.alibaba.com>
> > Cc: Dust Li <dust.li@linux.alibaba.com>
> > Cc: Sidraya Jayagond <sidraya@linux.ibm.com>
> > Cc: Mahanta Jambigi <mjambigi@linux.ibm.com>
> > Cc: Tony Lu <tonylu@linux.alibaba.com>
> > Cc: Wen Gu <guwen@linux.alibaba.com>
> > Cc: Willy Tarreau <w@1wt.eu>
> > Cc: linux-rdma@vger.kernel.org
> > Cc: linux-s390@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Atharva Vartak <atharva.a.vartak@gmail.com>
>
> Sashiko has reviewed this patch and found no issues. It looks great!
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6aba080c.b933486d=
.297b72.5042@mx.google.com?part=3D1
>
