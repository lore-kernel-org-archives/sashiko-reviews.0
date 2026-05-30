Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1AF3A8743
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140226; cv=none; b=De+nRXOZGioLFnA6hI17NnLCCNeomywyx3G1DnSFdsZGh1Z0hCbepJNkB0M9NMtdbpJb0VagiFQHpinRC2Ng+yPc1V0sV6ygjxGrO5h/XVxHYgngMlrHk32OCZLioK9LMw58peOy2Ox7Yid51cUVsuZsK8DVbOEzG4MKKk583t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140226; c=relaxed/simple;
	bh=fqQ3Hg89H3GsB0CP4W9QrCaNrQNDlxsW/z0iANBaiUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQs+o8dMDzHY+vt/ZCPC3dIK2tZ10uW4eqH4leFcC6KvtCtJqgkkZKCIqmL1C/RI0yril4VefAfLeOvbO2ybr8ib6xsspUffF41CsG7cxoXgTf0vJ17AAzwTMfmz/ePsi6yKblQhAcOcBsO/8sVWdXlrHG0PZ9TDsE73/vhaNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UdplQyAn; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UdplQyAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780140223;
	bh=fqQ3Hg89H3GsB0CP4W9QrCaNrQNDlxsW/z0iANBaiUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdplQyAnIT2uG9BIYvkIrU7XcoJw4aluQRub9rpLIopgNflAkfIkVjon4dn9GdAOV
	 fah8TZ2wBej/I1WQWS3V/7Fk/KKBVxZX9UFzolgwsz5tkQl9HeyXXEzZ5p86bMA9pf
	 g/bC3CzCIfjM8c9L39h5IKmSnMOoaaAzCu4MfLrs=
Date: Sat, 30 May 2026 13:23:42 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (cros_ec) Add support for displaying fan
 curves
Message-ID: <b1c58a43-826e-423f-8df7-0d11506063ba@t-8ch.de>
References: <20260529-cros_ec-hwmon-fan-curve-v1-4-da6792b3830f@weissschuh.net>
 <20260529212602.6AD3B1F00893@smtp.kernel.org>
 <ae7ff79c-8180-4f76-ab38-f0ab38ecf556@t-8ch.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae7ff79c-8180-4f76-ab38-f0ab38ecf556@t-8ch.de>

On 2026-05-30 13:04:04+0200, Thomas Weißschuh wrote:
> On 2026-05-29 21:26:01+0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Missing endianness conversion for EC thermal config data and sensor_num.
> > --
> > 
> > commit be72df851dc1a1ab2ed2868ddf58166c69fe3c4c
> > Author: Thomas Weißschuh <linux@weissschuh.net>
> > 
> > hwmon: (cros_ec) Add support for displaying fan curves
> > 
> > The automatic fan control mode of the embedded controller uses fan curves
> > with two trigger points to calculate the target fan speed. All temperature
> > sensors affect all fans. Expose these fan curves through the standard
> > hwmon sysfs ABI.
> > 
> > > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > > index a6cc909e56b7e..731143f8c6b2a 100644
> > > --- a/drivers/hwmon/cros_ec_hwmon.c
> > > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > > @@ -372,6 +375,141 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
> > >  	return 0;
> > >  }
> > 
> > [ ... ]
> > 
> > > +static ssize_t temp_auto_point_temp_show(struct device *dev, struct device_attribute *attr,
> > > +					 char *buf)
> > > +{
> > > +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> > > +	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > > +	struct ec_thermal_config config;
> > > +	u32 temp;
> > > +	int ret;
> > > +
> > > +	scoped_guard(hwmon_lock, dev) {
> > > +		ret = cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, &config);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
> > > +		temp = config.temp_fan_off;
> > > +	else /* temp_fan_max */
> > > +		temp = config.temp_fan_max;
> > 
> > [Severity: Medium]
> > Since the Chrome OS EC wire protocol is little-endian, do these raw u32
> > fields need to be converted using le32_to_cpu() to prevent corrupted values
> > on big-endian hosts?
> > 
> > It looks like the pre-existing cros_ec_hwmon_get_thermal_config() helper
> > similarly fails to use cpu_to_le32() when assigning req.sensor_num, which
> > could cause the EC to receive a byte-swapped sensor number.
> 
> None of the cros_ec drivers handle big-endian systems properly.
> But the drivers can only be used on little-endian systems anyways
> through the dependency chain SENSORS_CROS_EC -> MFD_CROS_EC_DEV ->
> CROS_EC -> X86 || ARM || ARM64 || COMPILE_TEST.
> 
> So we can ignore this for now in my opinion.

Of course ARM and ARM64 have big-endian variants.
I'll send a patch to prevent them being built there.

> To properly use leXX_to_cpu() helpers we would also need to change the
> protocol structs in include/linux/platform_data/cros_ec_commands.h to
> use the actual __leXX types.
> 
> > > +
> > > +	if (temp == 0)
> > > +		return -ENODATA;
> > > +
> > > +	return sysfs_emit(buf, "%ld\n", cros_ec_hwmon_kelvin_to_millicelsius(temp));
> > > +}
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net?part=4
