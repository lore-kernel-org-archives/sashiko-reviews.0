Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945532874FB
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784400452; cv=none; b=TT5POZFlZtOy/Ix7VfDEafQznxe5jn+6o2MsVGZT5PnRkSzZBVkY11FkGAwHdgvGvJvwyHdfwOaW/o028Y4ElNXCg0aZkrfOZA1GiarqGa4TZjPQPPR6ac1lzJ4JrOsTrE/4BpBzTYc0Too8zwuNscME/QYZ5ttlW2q9IZAq/SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784400452; c=relaxed/simple;
	bh=5brdqZ/1wXfjtic17d235LNB+dpZfhc5OvtCZzsQ5RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEc8NTPLirmyml0hYD4CaqczIfi400iZf2sKAjPlGptrP5jbLyPr0o9wSh5WnWm1x5l0AVFeJllAcyZ4TFjSpp+lbmbzSNQY/ERIeSL1NLkUfeJXBdzRcMSG9X4NMA4DtFWiLrD9LWZ9KV5vJ6VYee+QcqOAkhd9lIfqsQYX1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ24oM12; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ24oM12"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8114a4542b2so39164497b3.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 11:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784400449; x=1785005249; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fQTOmrHG5pvHqSModWaQQhiPltxOaTHtUmOHNGx1d18=;
        b=ZZ24oM12MdLIiaFClvCgu76j0+8u9w0mOtfY7fTK6fW5m1UuRFAxXWsGL3JlqRszWC
         FVz0EdTRSvLjqfL/8yN8XcmU+O6ygPbDz/bkBqQyTdDANMwnoSyB1Rk8lQOI6ducP7FL
         NBkNesQlfe5O08cKp31C3RZ9FCui2ogGFkmjsA3ZyUnG6+1ghcV3zJRdaxvh2Z4Ruk75
         LVcnBbSH7r4EdxGnrkRefNfOupmUdXGRJOjeEu35cYS1kta5NDWjJzCa87NOU8AzMBKv
         SG+uidiBEEnIpw/HIajJKTbM6Lv7K7I73be956yEosMlAnu0QYtZ5I0ZrZc2lC77caJL
         TZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784400449; x=1785005249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQTOmrHG5pvHqSModWaQQhiPltxOaTHtUmOHNGx1d18=;
        b=LqaPad1HuWB5Pl0Ze6eyDOsUHPY9eGAyEcNwZTdiXyjt/O5HsEZdDhpeTxQ0c26ZIt
         aD4DumvTsc+NekntNw6rEd2gpMJSU2TWt0xTEB+ZJX9+CI8cbCeHAOkuruu3c1lXfA9U
         FjfHgJgKJbQkXUsfvY0d6Ahhf8Bg25Dq99h95tb6481/4S45cfUDXgbmYhH6H50tKUTr
         viDrIC9In0c9Ge+k1Rf6NBcFv05gOtrDCxTfJs/j7R2ca2+pUENFEhTzYcZRlMP4hsLk
         RwOMuN04s2h+nGfcz09cnCg072+Fl8kBzNiV+CnDjxowOG0CogzE7C8yRlU5gJCrQwRQ
         Srlg==
X-Gm-Message-State: AOJu0YyTg4Mrg2VRI14uWhycHaTtlDWAs0s1O761L4aB+LOd1UmzVJ6L
	LZK+On9r099pdt8SP1iKPABBRSHF8beDUqVwmHVnlngT3s4+f37BTGg4
X-Gm-Gg: AfdE7cmfwYNO3gCuqd+llAbZcwPMckQMut6R6o38Y94BLTomob/IeNjHwqLmyFBiQR7
	1etrDFzEkF+dQtFZm0t489dvYsCDTyOCkF42TwJwioj7QSJivFQl0zQ+aTaKoR8SW39aYwfTEZx
	eo2QqM4BKo9++7bcY2Y/iJ42yUC449vyc1/BGkBIDTahqD71o3DR7WpH4fEgx8hZRu/l58JJv/T
	OyyEfBDVQes+x2rgg9bhZj76MIEtZBth33CR24UGYTXlxjdfme5yVJQ3RjFqP6MsyTRTgUVrgf4
	rVo7Jdu5ErTk3SoJD1xQ9e+CoEjSCPNsBWbrSF9vtaZ4ry7tMKHZfWFF+w0VGHELT+fzEZFsJ4E
	9y/J8gAdEpx+l1Tq5UA8QaMn+3UWSmAMAQU5XSbLJRePuEfImbq0EQm8mwlGcBket285lsRptMI
	F+bhuYsSJWhg==
X-Received: by 2002:a05:690c:9a8f:b0:7ff:19d6:74ee with SMTP id 00721157ae682-81ef28589d4mr26330087b3.33.1784400449216;
        Sat, 18 Jul 2026 11:47:29 -0700 (PDT)
Received: from localhost ([2804:30c:90d:6100:8a69:5cf5:f1f8:a1e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef4279508sm33890157b3.26.2026.07.18.11.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:47:28 -0700 (PDT)
Date: Sat, 18 Jul 2026 15:48:29 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
	Marcelo Schmitt <marcelo.schmitt@analog.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
Message-ID: <alvKfTS8Kj1MF3db@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1784235595.git.marcelo.schmitt@analog.com>
 <5108c89986ae8723139419058db1b2f2e74daff6.1784235595.git.marcelo.schmitt@analog.com>
 <20260716212838.95B3F1F000E9@smtp.kernel.org>
 <alpab2gBs4nPDU5g@debian-BULLSEYE-live-builder-AMD64>
 <20260718024628.3e2872ca@jic23-huawei>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718024628.3e2872ca@jic23-huawei>

TL;DR: Will switch to voltageY-voltageZ ABI.

On 07/18, Jonathan Cameron wrote:
> On Fri, 17 Jul 2026 13:38:07 -0300
> Marcelo Schmitt <marcelo.schmitt1@gmail.com> wrote:
> 
> > On 07/16, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] The `LTC2378_DIFF_CHANNEL` macro defines an IIO channel that is intended to be differential but lacks the `.differential = 1`, `.indexed = 1`, `.channel = 0`, and `.channel2 = 1` attributes.
> > > --
> > > 
> > > --- Patch [2]: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs ---
> > > commit 5710d5f25b45906977e2522567c1964b1d3219f8
> > > Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > 
> > > iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs
> > > 
> > > This commit adds a new driver for the Analog Devices LTC2378-20 and
> > > similar analog-to-digital converters.
> > >   
> > > > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > > > new file mode 100644
> > > > index 0000000000000..5600c820c7f45
> > > > --- /dev/null
> > > > +++ b/drivers/iio/adc/ltc2378.c
> > > > @@ -0,0 +1,416 @@  
> > > [ ... ]  
> > > > +#define LTC2378_DIFF_CHANNEL(_sign, _real_bits, _storage_bits)			\
> > > > +{										\
> > > > +	.type = IIO_VOLTAGE,							\
> > > > +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |				\
> > > > +			      BIT(IIO_CHAN_INFO_SCALE),				\
> > > > +	.scan_index = 0,							\  
> > > 
> > > [Severity: Medium]
> > > Does this macro need to set .differential = 1, .indexed = 1, .channel = 0,
> > > and .channel2 = 1? The name suggests these are differential channels, but
> > > without these attributes, the IIO ABI will expose them as single-ended
> > > (e.g., in_voltage_raw instead of in_voltage0-voltage1_raw).  
> > 
> > For parts with multiple inputs and configurable differential channels (e.g.
> > AD4130-8, MCP3561/2/4R, NAFE13388 [1, 2, 3]), the voltageY-voltageZ ABI helps
> > clarifying what physical inputs make up a channel. For differential only parts,
> > the ABI seems to be flexible by only requiring a 'consistent labeling' (either
> > voltageY or voltageY-voltageZ IIUC). Will set the channel with the differential
> > ABI if maintainers believe that's the best way to have it. Might slightly tweak
> > the channel macros to keep .differential = 0 for pseudo-differential chips
> > (e.g.LTC2369-18).
> 
> Whilst I get your point on differential only cases not really requiring the
> specification of two inputs, I think that does provide a simple indication
> to users that they are differential channel.
Agree. The first ADCs I've worked with were single-ended so having to provide
the negative input when working with differential ones was something noticeable
to me. Though, one applications engineer once called me out for the
voltageY-voltageZ naming arguing that a differential channel provided only one
input to his application and thus it should be labeled only 'voltageY' or even
just 'voltage'. Despite understanding that argument, I share the opinion 
that an indication of differential channel is helpful. Anyways, besides the
possibility for application to display channel names differently in user space,
I see we now have .read_label so the whole discussion seems pointless.

> 
> I would prefer that we make them 'look' like differential channels so make up
> a suitable number for the negative side.

Would it make sense to adjust the ABI doc to encourage the dual numbering for
differential channels? So I don't fall the temptation of single index in the
future :)

Thanks,
Marcelo
