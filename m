Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39AB438466
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806616; cv=none; b=iKsLfezb3DLR6ufdVHc8KLtJ2WaLaY4dR3oKuMzglP8Kj/a5T7EmoeJkQgeQ2+CTLtWNhrIyHwkpm4PUvoDCVh4sQxIns8Rqondva54uEYyrR6oh2u/bZVAhwrFQomf5O3++/OiTWqHiGcFuCj7gHskm5FFbjbIgU0kLc4iZjCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806616; c=relaxed/simple;
	bh=c2WauqA1rN3CFp8HwFYIcwS8fSlQMcIi3l9nCjLJYwg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9XT/KrL58Ypi7JbWS6zlFh8vSVx96keEwTwTrAhOFiRSdGFwzc+yLKivKuG1lShgHoE/s+ZksimCh7lkjeo3cwEb6/Zu7CyfIO+EG4H1NCRF8irq+3jFybA/gXpS3yWJL/+ml4Oa1KzZ4NLpzBWpCbriw8vLWXz7WAJ75ShvYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGPAGzCd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGPAGzCd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so11171405e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806613; x=1792411413; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=POtm/b4o0WrfuoXD0v62t4luuE1aVmfrnI+9DSSx1WM=;
        b=lGPAGzCd6dHkamoCQQGvzbGisVDlBQGGNtEAEL8ZHZt/jn+4V0HYPdxf4WcbBzGjcH
         aVl0KqobHbcpd1rOjhUW7otQffglCwDiwAX257CocdxDWd6HdslqYgNI8fWGYmKMsBZO
         68L4PKkPwDLSFFIVrOVAAVEeRm2g0frCTrS8sMwk4aTd6tDn8nZQ5sSPEabrwYJadVoq
         MuobHAqb5Co26CQhrnv3Hvp389UWbbzOHj1O6EvRpcTtscLtEgd2SS+A48Sg6P/H1W1M
         jCju78f6eonmIifiZTiIbCxi++asf3kT4SaBByUVbY57YN/zEAckBqYlB+UQ7oCGEJNp
         iZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806613; x=1792411413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POtm/b4o0WrfuoXD0v62t4luuE1aVmfrnI+9DSSx1WM=;
        b=OtZqAJ8xsdBSvIUHLCgmtmIKRc+d9sEOVt/QlQCJcp9aSP7tVZdD5YagIlW6HwqtOb
         8v/fW+CKjD7Z5YhFGOkNIIG484vPFlC5sso/AQB73706X1rRlrdAajcASNwM3sGg/b8U
         qL8vE5Zqkp4ISNLvv4oSTuQdvNr6NBZeo0G7TM5EsVStSWWe3uLsHnu5/cXRt9ABhlKZ
         7AQgFHShqQr6PVHorhGGACYOkuMF5/opPsJGEAtSQCnix7NrEj1xA4REq30eapKNtgZI
         ePssMt99F7Yj0bIDslqCN8F7tK2UEPzhh/4pSsswFqqzCSoRxJAp5rG0dhYyPKxNDdw1
         UqNg==
X-Gm-Message-State: AFq9FYIUr9AUEEaPFu2Tka4QhgXjl3PFdM8qD6Kg6dJxwX0KctOwB/eJ
	eHrUj/FESrztAQJ98lbKRx9c170pt8Gwt+fp222PUCCufVLZki6oj0IMW/MYqA==
X-Gm-Gg: AYBFou18CC06SdQlGQDtV9xO1DElOFm9JS689+yZoXGOp1V5a+vq/IOGIrgSjDfWZjc
	QQtabJ/9ngFZnYIBf1hpt9KB41NFOmOHhO/Xs6Grxtv7xn0chKlXVg+2xR38pjxFCGd0L0si8L+
	MZzJ5OP3q6PtwN4E/U6xqYrY0h+HKIDaTeCYcN5WC8N/w3qgFQFXKTiTA/QPTsv6MKdLdgL7Y5Q
	UGSSZQtgW2tYS29HSDhielh8MNOJn5vnHpnbOC968n/gvRtwEhnEE8vo9rFTQmrATW0nMoRvYpL
	IipolP8EBzPg+U/zCNhArbzpJ1HINM9YSdNYuJMjO89yJLZQHE+1e8G2bHAvx0LG6M5PG6QqEs3
	s0dPfvd+4CBe2m5+rpa78XH0APyT7KCwI6LwfcAevZdxQ/f0J0ZBQXZRoH84MUK+JCXIL33XoyX
	cMnqv7w5kVDmmcGRNCgNYruWAOrkIf+0eH6kKhuB9ISVR1oRrs41Pnw/abbO1xixopo415G9OC5
	rXK/kpTKxbDVp2xuuxri5MJxlngBjeveQwtV10kr+QkwkBgk0nitWTbjkx+dpM9FdUqI9kSwRKw
	pUQw4A==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr164627205e9.15.1791806612385;
        Mon, 12 Oct 2026 05:03:32 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a198c80cb3sm116458295e9.3.2026.10.12.05.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:03:31 -0700 (PDT)
Message-ID: <6acccc93.5808c898.2889ef.c057@mx.google.com>
X-Google-Original-Message-ID: <aszMkVq-GgiR1qMD@Ansuel-XPS.>
Date: Mon, 12 Oct 2026 14:03:29 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH net-next v25 05/10] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-6-ansuelsmth@gmail.com>
 <sashiko-outbox-166720@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-166720@kernel.org>

On Sat, Oct 10, 2026 at 04:11:39PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] net: phy: air_an8855: phy_write_mmd clobbers adjacent reserved fields
> - [Medium] net: phy: air_an8855: Array linear search underflow causes valid high efuse values to fall back to default
> --
> 
> commit e8cc9bb475e2accd40605a3774a8e659a3156338
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY
> 
> Add support for Airoha AN8855 Internal Switch Gigabit PHY. This is a
> simple PHY driver to configure and calibrate the PHY for the AN8855
> Switch with the use of NVMEM cells.
> 
> > diff --git a/drivers/net/phy/air_an8855.c b/drivers/net/phy/air_an8855.c
> > new file mode 100644
> > index 0000000000000..bc22256fd5f95
> > --- /dev/null
> > +++ b/drivers/net/phy/air_an8855.c
> > @@ -0,0 +1,275 @@
> 
> [ ... ]
> 
> > +static const u8 dsa_r50ohm_table[] = {
> > +	127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
> > +	127, 127, 127, 127, 127, 127, 127, 126, 122, 117,
> > +	112, 109, 104, 101,  97,  94,  90,  88,  84,  80,
> > +	78,  74,  72,  68,  66,  64,  61,  58,  56,  53,
> > +	51,  48,  47,  44,  42,  40,  38,  36,  34,  32,
> > +	31,  28,  27,  24,  24,  22,  20,  18,  16,  16,
> > +	14,  12,  11,   9
> > +};
> > +
> > +static int an8855_get_r50ohm_val(struct device *dev, const char *calib_name,
> > +				 u8 *dest)
> > +{
> > +	u32 shift_sel, val;
> > +	int ret;
> > +	int i;
> > +
> > +	ret = nvmem_cell_read_u32(dev, calib_name, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	shift_sel = FIELD_GET(AN8855_SWITCH_EFUSE_R50O, val);
> > +	for (i = 0; i < ARRAY_SIZE(dsa_r50ohm_table); i++)
> > +		if (dsa_r50ohm_table[i] == shift_sel)
> > +			break;
> > +
> > +	if (i < 8 || i >= ARRAY_SIZE(dsa_r50ohm_table))
> > +		*dest = dsa_r50ohm_table[25];
> > +	else
> > +		*dest = dsa_r50ohm_table[i - 8];
> 
> [Severity: Medium]
> Can a valid high efuse value cause an array search underflow here?
> 
> Since dsa_r50ohm_table contains 17 occurrences of 127 at the beginning of the
> array, a forward linear search for 127 breaks at i = 0.
> 
> The subsequent logic if (i < 8) intercepts i = 0 as an error. Consequently, an
> input of 127 falls back to index 25 (94), whereas an input of 126 correctly
> matches at index 17 and maps to table[17-8] (127). The forward search breaks
> the - 8 shift algorithm for saturated values.
>

This is exaclty the logic used by the original driver and how EFUSE are
fused on the PHY.
 
> > +
> > +	return 0;
> > +}
> 
> [ ... ]
> 
> > +static int an8855_config_init(struct phy_device *phydev)
> > +{
> 
> [ ... ]
> 
> > +	/* Apply values to reduce signal noise */
> > +	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_TX_PAIR_DLY_SEL_GBE,
> > +			     AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_A_GBE |
> > +			     AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_C_GBE,
> > +			     FIELD_PREP(AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_A_GBE, 0x4) |
> > +			     FIELD_PREP(AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_C_GBE, 0x4));
> > +	if (ret)
> > +		return ret;
> > +	ret = phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_CTRL,
> > +			       AN8855_PHY_RG_AD_SAMPLE_PHSEL_A |
> > +			       AN8855_PHY_RG_AD_SAMPLE_PHSEL_C);
> > +	if (ret)
> > +		return ret;
> > +	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_0,
> > +			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_A, 0x1));
> 
> [Severity: Medium]
> Does this inadvertently clear the adjacent reserved fields for pair B?
> 
> phy_write_mmd() unconditionally overwrites the entire 16-bit register. By
> writing FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_A, 0x1), this inadvertently zeroes
> out the adjacent 8-bit field AN8855_PHY_RG_AD_RESERVE0_B (bits 7:0). Should
> phy_modify_mmd() be used here instead?
> 

No this is intended.

> > +	if (ret)
> > +		return ret;
> > +	ret = phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_1,
> > +			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_C, 0x1));
> 
> [Severity: Medium]
> Similarly, does this inadvertently clear the adjacent reserved fields for
> pair D (AN8855_PHY_RG_AD_RESERVE0_D)?
> 

Intended.

> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261009161102.38961-1-ansuelsmth@gmail.com?part=5

-- 
	Ansuel
