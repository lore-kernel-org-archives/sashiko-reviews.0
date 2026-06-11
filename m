Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D4833CEA8
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196114; cv=none; b=PokLUAGr4zcub7K+1X624GfU7ZEAdlMO+o1j+xUkbdcbxo1izlAgMhEE5LlE2WjOVLvEIlX1tJDeS+5vl3G7mgZQB9Rj22MmP32p48R2Vd6TiQwtsNJ2CgS2OObKVnVpuAg3AI4HwSfcfvQ6QVbPMsOTJKZzzftGu7UJ4KhLC/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196114; c=relaxed/simple;
	bh=7HHp+3WkShofO9440BPrN8XP5Km3O/6+YPIuMN6rE3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgFL9KmbXcmgMKn7Sf1IZJLduPruPEBLfipkfrJK8MuInklfhPxt+nk58i1b055mNrCHBRgaDI6KmuxT3u0H+fldY4/Z7HFyeSQidy6LoySfxAWiByCnWsFDncDtq8pRkCKXLe8+HV71K3rk8ado5J1ijCqgTQWa9A3wUkoM+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Va2Re147; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Va2Re147"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8424b6792efso72021b3a.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781196112; x=1781800912; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rUavGM1P5RcCKJn/z9mz2Dyg9MS2Qfk4TLolVbqq+I=;
        b=Va2Re147edqbuD1oozJef57thQtFurODuZxOzx493YQ3w4I/sKiUBMFmlyFDTF1DHH
         H+hODLDVrOESc4Muz3g9S05gidJSjkxtag4yTUDSxGBMvI5Md+jtGF87Ss5rSV4/tEqD
         ZGmOCLZmhTr+ZGUBPRpOudYY3zzWuzhRMA66VVUt/D/8RsMZY8/HQMTFVhkdqXi48YO6
         9aXxHAUJusT/WgL6lHox/2BhcO3x9nY6o5zDCYejd0P+9dUpfuH7aY2HGh2xmAFDwvPD
         XkrDmhQZR6BSWXfu0D4nQ6p676HKzhAkJLWGuVyqhVNalhMJKth2B/4255qrxsVJbOIh
         g7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781196112; x=1781800912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2rUavGM1P5RcCKJn/z9mz2Dyg9MS2Qfk4TLolVbqq+I=;
        b=Eov0fQezYK2/HvOEPNLoS3Qup0Uf3azLnFEY0BEP7oicGFTwgi+9XDuRKrtvxUDwJu
         PE6rT7RCo1RQ25GgWNJgxhElzd8LO0jz56O+YemuYs+f+4VzVOIe1SKHBMQX6KexdQjs
         XfgMD5CeOgQjDn4gyCZvFmQa+ve1u7Cwz9LutUDksBy0h4Zsa6zPeOTbEClXcSoHBDGX
         Czb5PL0Y33ahfL/eEUuq9xMT3FFaP2ZcjjpiTRz0qGWQyQleobp+RkqEbgrxNOCP4sE5
         xy8L9JQ4wI/IxSpw2f5aERWzVAmyDwPSYZH0m1KsPNRIKzIDDkdj665W6Ya7jHrLX8f+
         RntQ==
X-Gm-Message-State: AOJu0YyIjxqNbsO5IsCATg6ct31I0L9XbGc+ChvaYAQHSZM82gbMJ6QW
	cblaCIJe/8rYuPs7tprr6VnSsUk9Lj/XP9Zc/h7w+3qvda8SDympQrZ+K7in+xkT
X-Gm-Gg: Acq92OGhp8chMuKc4ul496WKoaOP9tLkcu3MAsmtcZdHgbDrMeY9pd5Ex7lf6jYSxKP
	i1wrzbOWqn8TWsoLyd6HHdKUZU7MitpYZcGmh/U9ojgJdmf+zifR6hC9kkqI7Aem3/aDpUNOUY4
	mOZDCY6bqw8632SUPHvlRHf+vQ695hp30ICihWzrGjLLfYxvGULh/ugipoc477FfS5gL5y85j4G
	LEWPl86JDJLrq5j2ZEhxBmBdgTYolZwsZ8EgTiG3runyCdeZmiici7ss2B0TTTeGfDe6RI5qseJ
	4zR9WydJUDRJB56Ke6vdeCGRI+jM6KKKs6tKeUZ4qjZ2N3e6SbsMpWOnax4+UBJ5EiEQKYHlWaE
	KQC8xfVtavdIxafQAdHhMROa5i9OSFdhbC1wFcuHa0ELgqyu/MnFXIW0a4w88FK/AfW838TAwFR
	GarBhY3R22uZXDrpa2L61i963UGEeMP6+Y8ktP
X-Received: by 2002:a05:6a00:1144:b0:838:a46:ce96 with SMTP id d2e1a72fcca58-84336a9d4fdmr3914919b3a.27.1781196111707;
        Thu, 11 Jun 2026 09:41:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337661635sm3122661b3a.0.2026.06.11.09.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:41:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 11 Jun 2026 09:41:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <4a5f47d6-90ac-4365-b4ae-02d4ca4d31d4@roeck-us.net>
References: <20260611-blank-footprint-5504b819baec@spud>
 <20260611151316.685561F00893@smtp.kernel.org>
 <20260611-disaster-cadmium-91745bc1931d@spud>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-disaster-cadmium-91745bc1931d@spud>

On Thu, Jun 11, 2026 at 05:21:41PM +0100, Conor Dooley wrote:
> On Thu, Jun 11, 2026 at 03:13:16PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [Medium] Negative values written to `update_interval` are incorrectly clamped to the maximum interval instead of returning an error or clamping to 0.
> > - [Medium] Reading `update_interval` inconsistently under-reports the configured value due to integer division truncation.
> > - [Medium] Hardware sensors are enabled in `probe` but are not disabled on probe failure or driver unbind.
> > --
> > 
> > commit 91a403f5c5eef9fbcfcab3857179dc2f03ad3c89
> > Author: Lars Randers <lranders@mail.dk>
> > 
> > hwmon: add a driver for the temp/voltage sensor on PolarFire SoC
> > 
> > Add a driver for the temperature and voltage sensors on PolarFire SoC.
> > The temperature reports how hot the die is, and the voltages are the
> > SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> > 
> > > diff --git a/drivers/hwmon/tvs-mpfs.c b/drivers/hwmon/tvs-mpfs.c
> > > new file mode 100644
> > > index 0000000000000..48de8d98b3444
> > > --- /dev/null
> > > +++ b/drivers/hwmon/tvs-mpfs.c
> > 
> > [ ... ]
> > 
> > > +static int mpfs_tvs_interval_read(struct mpfs_tvs *data, u32 attr, long *val)
> > > +{
> > > +	u32 tmp;
> > > +
> > > +	if (attr != hwmon_chip_update_interval)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	regmap_read(data->regmap, MPFS_TVS_CTRL, &tmp);
> > > +	*val = FIELD_GET(MPFS_TVS_INTERVAL_MASK, tmp);
> > > +	*val *= MPFS_TVS_INTERVAL_SCALE;
> > > +	*val /= 1000;
> > 
> > [Severity: Medium]
> > Will this return an incorrectly truncated value for certain intervals?
> > 
> > Since integer division is used both here and in mpfs_tvs_interval_write(), 
> > the truncation can cause the readback value to be lower than what was written.
> > For example, writing 7 ms calculates `(7 * 1000) / 32 = 218`. Reading it back
> > computes `(218 * 32) / 1000 = 6` ms. 
> > 
> > Should DIV_ROUND_CLOSEST be used for these conversions to ensure the value
> > survives the round trip?
> 
> Hmm, this is actually a good point that I overlooked.
> What is the desired rounding behaviour here?
> IOW, should asking for 7 ms produce the closest interval less than 7 ms or
> the closest interval greater than 7 ms?
> 
> A consistent rounding is better than rounding to the closest IMO, if both
> update_interval and update_interval_us are going to be supported
> 

Not sure what you mean with "consistent rounding". Effectively the current
code is rounding down. I personally like using DIV_ROUND_CLOSEST() for both
read and write conversions because it gives the most accurate result. So
(7 * 1000) / 32 = 218.75 would result in 219 and (219 * 32) / 1000 = 7.008
would result in 7.

> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mpfs_tvs_interval_write(struct mpfs_tvs *data, u32 attr, long val)
> > > +{
> > > +	unsigned long temp = val;
> > > +
> > > +	if (attr != hwmon_chip_update_interval)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	temp = clamp(temp, 0U, MPFS_TVS_INTERVAL_MAX_MS);
> > 
> > [Severity: Medium]
> > Does this correctly handle negative input values?
> > 
> > The parameter `val` is signed, but it is assigned to `unsigned long temp`. If
> > a negative value is passed (e.g., -1), it undergoes an unsigned conversion and
> > becomes a large positive number like ULONG_MAX. 
> > 
> > When clamp() evaluates this against 8 ms, it incorrectly clamps to 8 instead of
> > returning -EINVAL or properly clamping to 0.
> 
> I can definitely clamp this without casting. I considered that inputting
> -1 to get the maximum was not really problematic given the documented
> range and that common sense doesn't permit negative times, but since I
> have to submit a v4 anyway, I'll just make this operate on the signed
> value.

Please do that. I don't think anyone would expect that writing -1
would result in programming the maximum.

Thanks,
Guenter
