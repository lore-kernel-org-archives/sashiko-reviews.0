Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6A21F1534
	for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060379; cv=none; b=mHncaHDxuHAPhmvMdBPB5BBV/uKAgw67J477aTwGnbpRdoANROplAMQZqT3kiNW0jvBsZMgX0PuoypaNMvD/xflyuD/7MpzXfmPhQl9eHrf2P7+VkjMHvFlCK00Zy5lqd+Yv+3ucGbGqOn03N4OfodSJ503q15clQ36yfpE1GHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060379; c=relaxed/simple;
	bh=iw//1nYvybdqqkGeIY69HOmAu1w0wu7f8YOrUClhZxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiqGYuJhODlrJ8bpeHGfrTxdDR49cv6k1dOfWOuAGIvC56KjLwWEkimWanciGkL4LoeOilv4P8oLlNu6e1jnqq5qumPIbUkIitQY/XukCyGtmEYvr2d6Kcn71r8FODcOTGzjulo53nQj1QaZDREzH4y8nvLPb5bKvBF0Mf21LBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvMBXe1K; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvMBXe1K"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1233834f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 03:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785060376; x=1785665176; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ql3lhaTIByhx1TYQR2BuqY3y5NYUIlkWuZWwh0ZdmCA=;
        b=TvMBXe1K1dyvhdx+K8VIgKovQ96cv9DLJd8KkPBNjc6Kkez0ZSoJ8k9u3zPfkOyDw6
         GH/tmCCvLjISAXnVvoLyzO2Qi15A/tdaS06V5N6CmQQcR60Yx6ch6V+cyeM6As3xnfEm
         QeS8dd1n3+gFTkdWwoEg0YJqLxX6PcgCqLe3wBZDqqEMfoNU5OPux3sEbkRxZPDXemiA
         WCCOttwkyOWByCb0CIkvn4L97g2dPQWzgC8xtfEIAUxMxPVdRxNvMXVMql7Dq52y84tR
         sj7lJ37gxE6ph1EUsxVy0w7TkUtkFJ/Y5lwgf80sDrddVWBtGTD2ic8Zp77CMnjVAbza
         hFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060376; x=1785665176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ql3lhaTIByhx1TYQR2BuqY3y5NYUIlkWuZWwh0ZdmCA=;
        b=lkSfk5L9TpA7YU+6nz6fmty1p309UN5YDISErZVLgsWPThxOiYf/ysvTDINgEDhqgt
         uZIW4uR+eIJ3vD1WqWN9Rh3GWrfPWo9379tqehzrcRuRMu7e60BMaSDKKRSpaBpBdlTD
         /BHCHndnAj+ylZtuYH9FAnYB+PYpFpE3itE0oIc6B7q29lCcQMFbdZt49WWVFeHYi+PN
         8xvIOmuJV3qIiyKPoLsHDRvNq7kLRyqL1q08UaahYw/XkDYhC55LFKPw99nS+7R53HKf
         2wzoLtkbQWBbo+lsDbQTyfzpm6C+o0papSck2jE6wM8G71+27tnlZV4WGHs962wZ8Yoh
         DhXw==
X-Gm-Message-State: AOJu0Yyj8rzTfJZC5vsJeXw2qvFejIiU1+woxmX9tWErtEnYCJZzh/Zj
	J72Znlcb7V0/BfS51LrCL/s2NOOSMIH1xvwlAExtVT/lc8gOwX4i3FSNFtRugPNY
X-Gm-Gg: AR+sD139UDhXOSgGIyj/GvZ0Zo7S6qzscVAl+AXxew9J19oZIt7Q8a47JkZ+ONnZn8z
	gmTau2x7BkcZrxTYKyoK8vYDpJusOdDf6W2AUqc5Hi2DhrAnO8v4peNFHFw+W14jPCfQ6iKjOx0
	ObSWYk4zgmENxXx4yFgJBo3xF7jA9SZknrJzMdWiFrmfzh6HCJWV+TBoYzFb7plGhs+S/q2+J1g
	v1hvkRYrh5I1kWlVfscONsHeYDOF67xakrp6hf4BKKFhFhsrr9C+t2Cf0Y704t50Nx5Gr0eE7Uf
	zK5ti+kS/L428ZBXvEaux4K6nA6rCVP2Q5yVmaO8X3EcJwCS6snbkRUZSbxjN/po55D02rNxdHz
	5Hr2iYqcrsHT/C4scg0ZUy3U6qb6s3+c7urrdfiYXuknpBU8S7eqrR4JwDqfQ6IwsgcKju7276x
	FDlbwlbFeVr/3E/W1p
X-Received: by 2002:a05:6000:40cf:b0:47f:962a:9f44 with SMTP id ffacd0b85a97d-47f9feb3481mr7445983f8f.20.1785060375545;
        Sun, 26 Jul 2026 03:06:15 -0700 (PDT)
Received: from antoniarch ([78.211.132.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm24469108f8f.26.2026.07.26.03.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:06:15 -0700 (PDT)
Date: Sun, 26 Jul 2026 12:04:48 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/8] rtc: abx80x: use regmap instead of I2C specific
 API
Message-ID: <amXTyINVJ2at6_Bz@antoniarch>
References: <20260725145718.14733-1-apokusinski01@gmail.com>
 <20260725145718.14733-6-apokusinski01@gmail.com>
 <20260725151314.0DA151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260725151314.0DA151F000E9@smtp.kernel.org>

On Sat, Jul 25, 2026 at 03:13:13PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Medium] The true error code from devm_regmap_init_i2c is discarded and masked as a hardcoded -EIO.
> 
> Pre-existing issues:
> - [Critical] Missing synchronization in NVMem transfer function leads to SRAM address page corruption.
> - [High] Unprotected read-modify-write sequences on the RTC status register (ABX8XX_REG_STATUS) between process context and the threaded IRQ handler.
> --
> 
> --- Patch [5]: [PATCH v2 5/8] rtc: abx80x: use regmap instead of I2C specific API ---
> commit 5491aafa92a95d35d02d312fb0fd904216ed5a97
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: use regmap instead of I2C specific API
>     
> Rework the driver so that it uses regmap_* functions for communication
> with the device instead of the i2c_smbus_* API. This way the support for
> ABX81X RTCs which use SPI can be added later.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index b83c789e213d6..3c5ab0ffbea84 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -279,36 +283,35 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> >  	 * reset kicks in.
> >  	 */
> >  	if (status & ABX8XX_STATUS_WDT) {
> > -		dev_alert(&client->dev, "watchdog timeout interrupt.\n");
> > +		dev_alert(dev, "watchdog timeout interrupt.\n");
> >  		handled = IRQ_HANDLED;
> >  	}
> >  
> >  	if (handled == IRQ_HANDLED)
> > -		i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
> > -					  status & ~(ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT));
> > +		regmap_write(priv->regmap, ABX8XX_REG_STATUS,
> > +			     status & ~(ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT));
> 
> [Severity: High]
> This is a pre-existing issue, but can concurrent read-modify-write sequences
> on the ABX8XX_REG_STATUS register overwrite each other's changes?
> 
> The threaded IRQ handler abx80x_handle_irq() acknowledges interrupts with an
> unlocked read-modify-write. At the same time, abx80x_ioctl() does an unlocked
> read-modify-write to clear the BLF bit:
> 
> abx80x_ioctl()
>     case RTC_VL_CLR:
>         err = regmap_read(priv->regmap, ABX8XX_REG_STATUS, &status);
>         status &= ~ABX8XX_STATUS_BLF;
>         err = regmap_write(priv->regmap, ABX8XX_REG_STATUS, status);
> 
> If the ioctl races with the threaded IRQ handler, could this lead to lost
> interrupt acknowledgments or lost battery low flags?
> 
> [ ... ]
> > @@ -702,31 +704,27 @@ static int abx80x_nvmem_xfer(struct abx80x_priv *priv, unsigned int offset,
> >  	int ret;
> >  
> >  	while (bytes) {
> > -		u8 extram, reg, len, lower, upper;
> > +		u8 reg, len, lower, upper;
> >  
> >  		lower = FIELD_GET(NVMEM_ADDR_LOWER, offset);
> >  		upper = FIELD_GET(NVMEM_ADDR_UPPER, offset);
> > -		extram = FIELD_PREP(ABX8XX_EXTRAM_XADS, upper);
> >  		reg = ABX8XX_SRAM_BASE + lower;
> >  		len = min(lower + bytes, (size_t)ABX8XX_SRAM_WIN_SIZE) - lower;
> >  		len = min_t(u8, len, I2C_SMBUS_BLOCK_MAX);
> >  
> > -		ret = i2c_smbus_write_byte_data(priv->client, ABX8XX_REG_EXTRAM,
> > -						extram);
> > +		ret = regmap_update_bits(priv->regmap, ABX8XX_REG_EXTRAM,
> > +					 ABX8XX_EXTRAM_XADS, upper);
> >  		if (ret)
> >  			return ret;
> >  
> >  		if (write) {
> > -			ret = i2c_smbus_write_i2c_block_data(priv->client, reg,
> > -							     len, val);
> > +			ret = regmap_bulk_write(priv->regmap, reg, val, len);
> 
> [Severity: Critical]
> This is a pre-existing issue, but does this missing synchronization lead to
> SRAM address page corruption?
> 
> The NVMem core does not serialize device callbacks, which means two threads
> could access NVMem concurrently. If Thread A updates ABX8XX_REG_EXTRAM to
> select the address page, could Thread B preempt and update the same register
> to a different page before Thread A performs its bulk write?
> 
> Would Thread A then write data to the wrong SRAM page?

Ok so according to the review this driver is missing locking altogether. Most of
the comments from sashiko in this v2 regard some race conditions that
exist here. To sum up, the problems are:
* concurrent accesses to the NVMEM xfer function
* lack of synchronization for any "write_config_key + reg_write" operation 
* concurrent accesses to REG_STATUS

I think that adding a single mutex and proper lock guards all
over the driver code would be sufficient, will do that in v3
in a separate patch.
Perhaps some finer-grained locking would be possible but this 
would complicate things too much in my opinion. 

> 
> [ ... ]
> > @@ -779,6 +809,7 @@ MODULE_DEVICE_TABLE(i2c, abx80x_id);
> >  
> >  static int abx80x_probe(struct i2c_client *client)
> >  {
> > +	struct regmap *regmap;
> >  	struct device_node *np = client->dev.of_node;
> >  	struct abx80x_priv *priv;
> >  	int i, data, err, trickle_cfg = -EINVAL;
> > @@ -793,8 +824,27 @@ static int abx80x_probe(struct i2c_client *client)
> >  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> >  		return -ENODEV;
> >  
> > -	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ID0,
> > -					    sizeof(buf), buf);
> > +	regmap = devm_regmap_init_i2c(client, &abx80x_regmap_config_i2c);
> > +	if (IS_ERR(regmap)) {
> > +		dev_err(&client->dev, "Unable to allocate regmap\n");
> > +		return -EIO;
> > +	}
> 
> [Severity: Medium]
> Should this code return the actual error code from devm_regmap_init_i2c() 
> (such as -ENOMEM or -ENODEV) via PTR_ERR(regmap) instead of discarding it 
> for a hardcoded -EIO?
> 
> Masking the original error code could make debugging initialization failures 
> more difficult.
Yes, there should be PTR_ERR() in here, same situation as with the devm_regmap_init_spi()
in PATCH 8.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260725145718.14733-1-apokusinski01@gmail.com?part=5
