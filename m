Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428420;
	b=wRM8HpPik6oLAuNxOwgxOAmV8bjCm5nRW3NBqH5wsy3UFaHihsIPnHoSnGkfzKjrKUQA
	 GOvW58DfDgam+Zotm4QT3Diczlt/TEFaxvnKAn2E3Lx+icKxN+cuuOlicIPWk2CFvlrNH
	 n4MrArJJ+GRnV0q0gC5Mb0yla+qa/lUnkxYKiUGNvnEc9j+BEIr1BBkUirbJZL9FW8jBX
	 XRmfjrylNJN6RshrvBhpxUZKRpryYQXZDgOdw6MKTzYAAXfG7Roeig+LJNGDGw+D//xcY
	 vCdzpeUQrravAQQRDXvwQ0CRLvNHk31uHTZ5+Xwnbk58gvmAJHEtDDYBTxXrG0kNmmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
	 X-Google-Original-Message-ID:Date:From:To:Cc:Subject:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0/9efCui3/xIgzAalfuRCkOK3+yAIMEf/WrJRW5n/Zc=;
	b=hw1Y8DNcIyurPcKjDsX7oaQt/i8EHOxQtulMhbvX7ETV/0+vS5QdGqTR+j24zbjV01Dg
	 Ls6siSJTlTGBJAhSBs8LstWofwUNkxccaznL7zXt/E3WF2qkiIkzdL2rve8JUa1CTG3VW
	 XejyV+GnfhuA+D0qAYj53OPzs3wlOKtf6PfA13Hfys+7lnK/gNtPBpIyaWLqrdTX17ODc
	 khgc28mC13sg9E2s9OBqZ1rcaEn8zYkj8t2TvOxGcmLfs+TFbKwtsrf61vs56AAYFpU3t
	 POeV+qtkdaBTjMeJVp4sdBZ4pAdSQaTDShVe/jvxN5xvXCNKMjCoVbdZp558gahSw9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JV3bOuWZ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D600606A338
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 16:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D600606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JV3bOuWZ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso21443415e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792428419; x=1793033219; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/9efCui3/xIgzAalfuRCkOK3+yAIMEf/WrJRW5n/Zc=;
        b=JV3bOuWZ9nDvqSjces454GoZxw+gfRlRNyCUXOIz2ZlaG2mw2C40H6WtbbKHdFjvYg
         PQrOgXcIFeMS0OcXi7efY8bSRIuMUATi+lezm/KhJFA/jPT1taoqApE98eC1gr8LMp9o
         brFB9nalzx/szc/gXD9QHfY1W3cpR3XExsaQ9I5hJ3qC+FuwvDfdBwjIsmps25gL8gUL
         J2XO9wZjW9jc1ntp8dTPXmxDpH4zAWuow42g1PL5vEEww9tyi/6DU2Tq3xvXEB3DbqZh
         oaWr1NxA7G9j+Rd0daA7ceaRNDNBrVa8ff3GzFkrT4gE/WDKeJ8kKHR6+Fvf0bcKFakQ
         T5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428419; x=1793033219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/9efCui3/xIgzAalfuRCkOK3+yAIMEf/WrJRW5n/Zc=;
        b=D8Tq72Q4UY6ib5Ew+KEsSpyO+aI//dfxwY9NMpFeph6lx8tK6BdHO4Bf12mv3O+C7j
         m88reI5PXiys6XqBH7wSnhW1VxvgxwIP42mr42erl6NczXUpEtYzH9okx5IHFQq76Tjj
         PJgOSA2gr7YrlEGV4OtD0gO/G9sF7Ct/NA5L4g4GsfYZk3ZtYdavv+/QH082x72klMKC
         SCHayRVXwTyqI7v9E0Cvw1Hhn8d1+bXEjfU3lSw32fry2Fhd7C5mwZNkjdAmywgqKpnA
         wD6nFEPineADISYuWhM4hZDJCTeDnOdneGDKc9mWBreZZw/xl/C+7npaNjgu0pXCkkEb
         c8cg==
X-Gm-Message-State: AFq9FYLLIUPl4G2Gg4MfAD1wO0wqqg13OkMQzsCeEQ0/iJpXhxKAMtf6
	5z4sH0BVFk2qJ93K8VOpmmBp1fcMb5mgvnopoAFEORv9S3zohn7mz4ti
X-Gm-Gg: AYBFou1mb18gcuH3MWBqpKwa4h8SWf1xh6jVzsF8Dy6kwv9/AgmiUTKPN6orP8ixav5
	al7h5d0YbbZ+4ClXzSlSFMZNZ+O8jKP9Qq32e9WREYTh67zhroeeB/oi5nhITpikH9YxdWtk+7N
	AdMcs5ah0aVLN2AKeovO0g5yW1PPjq1X1tx9ASD0V2OqOP9TBDEyOcv7Ql7rs3oeUIztGFlV2aH
	P7CmCC3ix1U0nKqkubRbO1o2dSJyIrJoYh73jbiDWBuo8MJ1rNfVrtm/cFoO27qqt+EtKWCavzh
	x1UWa8IRUfdNq1U1JE2cUgW3R7gwAyM94c7bEHoDHLZih+eqltb+QyQmfMTGoRRWM0L7QZoPZO/
	DL4s0eAfQDgP+1FN3dgQ6bKGpXeD5SUQ3lQXdxpk1CcN5TRUTz1dxPVp4s3z1AHeai++YqyinC5
	xq3v9XsxGNpq59Zq0CMg9VtQ5EawjUWTZ4Og1NGthEmdXMHVotzipKbMTnILsolThLkSfURZ6Fd
	L5QcNNzAK2GDcbP5YuFKhoeZLQn1Muvcuy1UNwqCIlLkLxV8lB5lUhvqPh4UQ==
X-Received: by 2002:a05:600c:3551:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a1d75a4653mr187564615e9.2.1792428418471;
        Mon, 19 Oct 2026 09:46:58 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm2377005e9.4.2026.10.19.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:57 -0700 (PDT)
Message-ID: <6ad64981.198a47d7.3d6d5a.6d01@mx.google.com>
X-Google-Original-Message-ID: <atZJfjkGIL2V--en@Ansuel-XPS.>
Date: Mon, 19 Oct 2026 18:46:54 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-5-ansuelsmth@gmail.com>
 <sashiko-outbox-166721@kernel.org>
 <6acccc4e.4c22a69b.132624.271f@mx.google.com>
 <20261019164430.GI2663669@google.com>
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
In-Reply-To: <20261019164430.GI2663669@google.com>

On Mon, Oct 19, 2026 at 05:44:30PM +0100, Lee Jones wrote:
> On Mon, 12 Oct 2026, Christian Marangi wrote:
> 
> > On Sat, Oct 10, 2026 at 04:11:40PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > - [Medium] mfd: overlapping regmap readable ranges for General Purpose and GPU timers
> > > - [Low] mfd: structure and variable naming violates MFD API guidelines
> > > --
> > > 
> > > commit 05d4dc95b969f0fcf66d11398aafad3e7eb7c7f1
> > > Author: Christian Marangi <ansuelsmth@gmail.com>
> > > 
> > > mfd: an8855: Add support for Airoha AN8855 Switch
> > > 
> > > This commit adds support for the Airoha AN8855 Switch which provides
> > > a DSA switch and a NVMEM provider. It utilizes the mdio-regmap driver
> > > and registers a regmap for each internal PHY.
> > > 
> > > > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > > > new file mode 100644
> > > > index 0000000000000..a2778511dfefc
> > > > --- /dev/null
> > > > +++ b/drivers/mfd/airoha-an8855.c
> > > [ ... ]
> > > > +static const struct regmap_range an8855_readable_ranges[] = {
> > > [ ... ]
> > > > +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> > > > +	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
> > > > +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> > > 
> > > [Severity: Medium]
> > > Is this range definition correct? The General Purpose Timer range
> > > (0x1000a100 to 0x1000a2ff) fully overlaps with the GPU timer range
> > > (0x1000a200 to 0x1000a2ff).
> > > 
> > > Could this be a typo in the hardware memory map definition? It seems like
> > > the General Purpose Timer range might have been intended to end at
> > > 0x1000a1ff to avoid overlapping and potential register access boundary
> > > issues.
> > 
> > I have to double check this from documentation, but if possible I would
> > like to fix this with a followup patch.
> >  
> > > [ ... ]
> > > > +static int an8855_core_probe(struct mdio_device *mdiodev)
> > > > +{
> > > > +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> > > > +	struct device *dev = &mdiodev->dev;
> > > > +	struct an8855_core *priv;
> > > > +	struct regmap *regmap;
> > > > +	int num_phys;
> > > > +	int i, ret;
> > > > +
> > > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > 
> > > [Severity: Low]
> > > This isn't a bug, but does this variable and structure naming align with MFD
> > > subsystem conventions?
> > > 
> > > The MFD guidelines suggest avoiding generic variable names like priv, and
> > > instead recommend using ddata for the instance variable. Also, should the
> > > struct name itself avoid hardcoding implementation details like core?
> > > Naming it something closer to struct an8855 might better adhere to the
> > > subsystem guidelines.
> > > 
> > 
> > I already updated the struct, is it needed to also update the local
> > variables?
> 
> Ah, I was just about to apply this!
> 
> This would be preferred:
> 
>   struct an8855 *ddata;
>

Ahhhhhh! You got me!

Do you think there might be a faster method to submit this so I can quickly
rename the variable and you can pick it? 

-- 
	Ansuel
