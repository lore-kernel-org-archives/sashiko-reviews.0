Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620373D5652;
	Thu, 10 Sep 2026 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032307; cv=none; b=j3wx12kgyOuXxcQKrZ04c3T4c95P0b49EBRd2TdXZ4CB/pmfshNzHAoRqoxs3nYCOBp86KZ5wjeqY2nfXtTiHqLRI+QdlmssxkQegGj/cmyEqcsQ/8AVCD8N8uSMita85IvMANo7eaXNFsqGATyLYussaxtbpPfZ0qeQ8gn9SMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032307; c=relaxed/simple;
	bh=O/tLdp24MIsZrhWxLmvWdUZJi6UicPZhmWtW5M/h6QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOCKN335ipcZF1sv4oxIoCX3YbkaJZBRwu8+84LMEK/SCiO2MAf2Zolwddr9FRLzjhHhYDEHR+nNqZ+ClDDblrLWy6d7ju9DQykSpFKLQh1SPdPfHbZqt8nP/O+Lmx9/KpljNRGqshM3gJUmsbGpTIzB0UzOkf7TA2BKjhMHT6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnI8XXMl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnI8XXMl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE491F000FF;
	Thu, 10 Sep 2026 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032294;
	bh=ZsZOkfdDhjGLuusYIFSvV1cCRSLFc8W912c9x/veDEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VnI8XXMlA0nzsAqh6FmY8dqfwZm5Kq8a99iq+flWJBk2Ij3sfXtmg+tLoJjczuI75
	 5RXfdFMA36h933G0tAFMRLjLxJ5ju3gIPhzBPPg20ieUTq6JOBvk5YPZjJehNX0BnV
	 tvsx4efbrP3/ueQsRvc2EasdfXPCKB0PqjhoyZij3vSkmyUszKRI0pKS6huOR7bWYs
	 myvnk5Ag7Ayl6NAgFK4SrcY8UeYP4FNl9xHAdOiy7L8TGx6Thz6DGiwOWsKpyYScKU
	 fYmA7YkzLI0I2eHyKZvQHOhSx+Urdo0DnbkDAFQcu8830CXlQ0jHaTIVQtYh/rtrqp
	 LEveqVT2QhKJw==
Date: Thu, 10 Sep 2026 10:24:50 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "hpp.iscas" <hppiscas@163.com>, mfd@lists.linux.dev
Subject: Re: [PATCH] mfd: max77620: publish I2C and OF module aliases
Message-ID: <20260910092450.GL2133376@google.com>
References: <20260905134051.66545-1-hppiscas@163.com>
 <20260905135123.4E8811F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905135123.4E8811F00A3D@smtp.kernel.org>

On Sat, 05 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Adding an `of_match_table` without migrating device matching logic causes a NULL pointer dereference when binding via OF fallback compatibles.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> commit d8b3d136289436a8115d93de5fbb49572114282f
> Author: hpp.iscas <hppiscas@163.com>
> 
> mfd: max77620: publish I2C and OF module aliases
> 
> This commit publishes the I2C module alias and adds an OF match table to
> support device enumeration. The patch intentionally leaves the existing
> i2c_client_get_device_id() call as the source of chip data.
> 
> > diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> > index c4f89a9681f34..6a624e691fe83 100644
> > --- a/drivers/mfd/max77620.c
> > +++ b/drivers/mfd/max77620.c
> > @@ -699,6 +699,15 @@ static const struct i2c_device_id max77620_id[] = {
> >  	{"max77663", MAX77663},
> >  	{},
> >  };
> > +MODULE_DEVICE_TABLE(i2c, max77620_id);
> > +
> > +static const struct of_device_id max77620_of_match[] = {
> > +	{ .compatible = "maxim,max77620" },
> > +	{ .compatible = "maxim,max20024" },
> > +	{ .compatible = "maxim,max77663" },
> > +	{ }
> > +};
> 
> [Severity: High]
> Does adding this OF match table without populating the .data fields and
> migrating the matching logic to i2c_get_match_data() introduce a NULL pointer
> dereference during probe?
> 
> If a device tree uses a fallback compatible string not present in the I2C ID
> table (e.g., compatible = "maxim,future-chip", "maxim,max77620";), the
> device will bind successfully due to this new OF match table. However, the I2C
> core sets client->name to the first string ("future-chip").
> 
> Because max77620_probe() still relies on i2c_client_get_device_id() to obtain
> chip data:
> 
> drivers/mfd/max77620.c:max77620_probe() {
>     ...
>     const struct i2c_device_id *id = i2c_client_get_device_id(client);
>     ...
>     chip->chip_id = (enum max77620_chip_id)id->driver_data;
>     ...
> }
> 
> Will i2c_client_get_device_id() return NULL since the fallback name isn't in
> the I2C table, leading to a kernel panic when dereferencing id->driver_data?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260905134051.66545-1-hppiscas@163.com?part=1

-- 
Lee Jones
