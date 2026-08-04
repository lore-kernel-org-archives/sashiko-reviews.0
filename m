Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500E143BDDC
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785834285; cv=none; b=Qx9e6laXt4/fIen9dgg1V+Gb1mqooVjOnWpu/nKq1pzn6Gnq8rsB4D+09WyUaHPutFwfvpTYlsCTNNbNy1FAaMaCruq7YclZKJO2AX4gTdIy8ay39sjKNCQugzqjO/GRQxSnBVyDBhHTuW6MPYpL98YrJyk47okQ2036apYNzUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785834285; c=relaxed/simple;
	bh=0jL2w+SolyTTvOnDtWZM/sEAY+hmOUYdWAyDxxHnoQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4FEjnPAnEG/k1Su+cft3wd7wt1L8IvG9N7WsURXu98Aa5Q8HUhge39QXU1DWOV0jfFOcZBVKGIhCH0u5SG0jwoMtFaryjr1V5DqbrGQKNSmJGNdqVyybFaIYa805VaE0/4gBcBPjj2cAFN+2zd7oMn12ixnbXGTthg+LW1CcZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmS/fBGE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmS/fBGE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49802c418b5so24864445e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785834281; x=1786439081; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+7in0iqAam6igQXMwDR/UZUiEop9VUXSy8nMMaT7/Q=;
        b=MmS/fBGEfH1jZbD5BxE55YIQQZrT4aDTpbPn8UcJ7xxfW3mag4a5im2vWUDxg/VQEr
         dercPBVg2G7hxoqXR2JUa4PYoTpotEQlbpqMkP44rG5gG+5W27L80fCTOiQbs4IUL1XJ
         xduPJ57Fv62nkW8a/W2B3wKXklkuYOPJg4PI5ptphRgpdGmcp4JWQKlvm7UOmsRwKm0r
         t3SArgS5IBlRnMjyEv/hq7pQNZ0kmWdYN7Yt/IFi4KYollywXUJzYUXC5W1pCwzxGalU
         LO1hM3uibXGg/rT3wkTIPwFmJ34pwBLLTvToz1IpUkSTHQBV/Y8oPtrYC8gS/ld/kAMe
         QDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785834281; x=1786439081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7+7in0iqAam6igQXMwDR/UZUiEop9VUXSy8nMMaT7/Q=;
        b=GTWnRLXMfRwu+xXNwgjrNAwvwcWDRn84Ka+zLPvUktzLUMw1lHYulLKZCsWYb29OO1
         y4bzIQJCfNjSIx4uKFebZig2B8GvLmZ/Id2cb4oHTF0S83u+Kp+9PeHycXFwKRpSw/kE
         eGPo3Ccp5lWIb9hwbPIu0Lx0hJ46kks0fKN0ibNzkFpN6J4FoZm5O4Gw8sSwRDw9gNhX
         HDvw8r1FjYB8aQozX506ClzYZ8ra0yJorB5JzK/WirQ5SFdkOmXHQMIMW7EDa5WQHkGB
         iU24jj3/4rytEtcvbiqLrKEkh8hYQzi/ZJpne5PnTJIZrxJz/FW6bhabRjUubVEk4hua
         LuaQ==
X-Gm-Message-State: AOJu0YzxbazSG0g/RLP8B+lr7HHHpOUedMFKpbE18DTwDTvcSovunoNe
	XrXP0Gt7U/HUHZGivi+FUQ/KQ5WNndtZAhuwXzWxk7BLZpS+nwQqKTGo
X-Gm-Gg: AR+sD13owhKDjjL2DXT5jYQ9awUlBL0S/A1vYVKtttGIWyvjwXgnZhEFWMyBjaCIhzJ
	RN3qgREhSLHmiwTN3GpkPa2Xo6YHHTWU9DVKGrdjRa5zFLS+c+xQ7iTO9Lzh9H6vYrSVzi/onBR
	huphPGJkRJ82UflX42ADdP2ZNiO6RbAtmfYGIeqwdA2ZXwf3PrPtR397ANSa1H5Kwa0tcEcFGKo
	AXmx0G9pR0XrCOzrvib5axxTRZLstGCqL2DCctOxkEL/geTe826/7AmvL5DGi/CiN/09M6FnwpC
	B3hqo7yovuL3Givx3nIfcPBshxLpZGAX8LlG1Iwl35Z13G9/i902xDWe28aSmQKCs8xFhnVUCU2
	GW5xyhsOq09q5YGThuN6E7v87AqKZx3XVTG3P/h38veJ1nShqqRcEI5a5xu9Gm818Y7U/eBuRlh
	4taZdGGnnRKPIKKez921FMlqnVrT5qVryMjjzmcEs3ei72/ygq7+8X
X-Received: by 2002:a05:600c:c8c:b0:493:eed4:7210 with SMTP id 5b1f17b1804b1-4980c673866mr245619265e9.11.1785834281201;
        Tue, 04 Aug 2026 02:04:41 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a101ac9sm64111255e9.15.2026.08.04.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 02:04:40 -0700 (PDT)
Date: Tue, 4 Aug 2026 10:05:51 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Message-ID: <anGrNyrEX5GX9lYJ@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <20260728162749.A42051F000E9@smtp.kernel.org>
 <e8ba1c8a-cf68-421e-9974-f31f31e90e59@roeck-us.net>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8ba1c8a-cf68-421e-9974-f31f31e90e59@roeck-us.net>

On Tue, Jul 28, 2026 at 11:13:26AM -0700, Guenter Roeck wrote:
> On 7/28/26 09:27, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > 
> > New issues:
> > - [High] Stack buffer overflow in `pmbus_debugfs_block_read` due to unbounded return value from custom `read_block_data` callback.
> > 
> > Pre-existing issues:
> > - [High] TOCTOU data race on PMBus hardware page selection during probe.
> > --
> > 
> > --- Patch [3]: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data() ---
> > commit c4bd4d03203a9fd14a7a2bcff69ec842b441fa68
> > Author: Nuno Sá <nuno.sa@analog.com>
> > 
> > hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data()
> > 
> > This commit introduces a mapping function to pmbus_read_block_data() in
> > preparation for adding support to a device which needs to use its own
> > read_block implementation.
> > 
> > > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > > index 3d5586c67f840..d697939ec8921 100644
> > > --- a/drivers/hwmon/pmbus/pmbus.h
> > > +++ b/drivers/hwmon/pmbus/pmbus.h
> > > @@ -459,6 +459,9 @@ struct pmbus_driver_info {
> > >   	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
> > >   	int (*read_word_data)(struct i2c_client *client, int page, int phase,
> > >   			      int reg);
> > > +	/* size of data_buf is I2C_SMBUS_BLOCK_MAX + 2 */
> > > +	int (*read_block_data)(struct i2c_client *client, int page, u8 reg,
> > > +			       char *data_buf);
> > 
> > [Severity: High]
> > Does this API need a size limit parameter? The comment specifies the buffer
> > size is 34, without providing a limit parameter to the callback, which might
> > encourage callbacks to return values up to 34.
> > 
> 
> The maximum amount of data returned must be 32 bytes, not 34. Callers define
> a larger buffer size to be able to append, for example, '\n\0'. The function
> itself, however, must not return more than 32 bytes of data, plus the data
> length in the first byte.

Curious, do you want me to drop the comment or your reply is also about
giving AI context so it does not come up again with the comment?

- Nuno Sá

> 
> Guenter
> > [ ... ]
> > 
> > > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > > index 7b58f71985741..ff4572c473b70 100644
> > > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > [ ... ]
> > > @@ -678,7 +698,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
> > >   	struct pmbus_data *data = i2c_get_clientdata(client);
> > >   	char data_buf[I2C_SMBUS_BLOCK_MAX + 2];
> > > -	rv = pmbus_read_block_data(client, page, reg, data_buf);
> > > +	rv = _pmbus_read_block_data(client, page, reg, data_buf);
> > 
> > [Severity: High]
> > This is a pre-existing issue, but can this lead to a race condition with
> > sysfs accesses during probe?
> > 
> > Looking at pmbus_init_debugfs(), it traverses pages and reads registers
> > without taking the pmbus_lock. This indirectly invokes pmbus_set_page()
> > through pmbus_check_block_register():
> > 
> > pmbus_init_debugfs()
> >    pmbus_check_block_register()
> >      _pmbus_read_block_data()
> >        pmbus_read_block_data()
> >          pmbus_set_page()
> > 
> > If userspace reads or writes to a sysfs attribute concurrently, it acquires
> > the lock and sets the hardware page. Could the lockless call from
> > pmbus_init_debugfs() interleave between the sysfs thread's pmbus_set_page()
> > and its subsequent I2C operation, causing the sysfs thread to hit the wrong
> > PMBus page?
> > 
> > >   	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
> > >   		rv = pmbus_check_status_cml(client);
> > [ ... ]
> > > @@ -3564,7 +3584,7 @@ static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
> > >   	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
> > >   	scoped_guard(pmbus_lock, client) {
> > > -		rc = pmbus_read_block_data(client, entry->page, entry->reg, data);
> > > +		rc = _pmbus_read_block_data(client, entry->page, entry->reg, data);
> > >   		if (rc < 0)
> > >   			return rc;
> > >   	}
> > 
> > [Severity: High]
> > Can the new callback return a value large enough to cause an out-of-bounds
> > write here?
> > 
> > If _pmbus_read_block_data() delegates to the new read_block_data callback,
> > and that callback returns a size of 34 (I2C_SMBUS_BLOCK_MAX + 2) or greater,
> > would it cause a buffer overflow?
> > 
> > Just below this hunk in pmbus_debugfs_block_read(), the code does:
> > 
> >      data[rc] = '\n';
> > 
> > Since the size of the data array is 34, an rc of 34 would write past the end
> > of the array. Is a bounds check needed on rc before using it as an index?
> > 
> 
