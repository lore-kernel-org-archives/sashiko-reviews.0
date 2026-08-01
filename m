Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A2C34C806
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 05:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785562136; cv=none; b=MeuFdk3e3Y4WWEwhrX77O4aNMj2hWHDDBAKPoUAKNofH9G5sdhNa63EFwbieQL1890Jz7aqYhCTDZG2Bu1ugReVIJut9ezFfdl3JxwSHXdx724+WHa3qtj5ZQCNnKBEobH58eI5PRId3Tu43+PkUM6uOfWp0KTWsOoaIAflOtVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785562136; c=relaxed/simple;
	bh=NKRiEWM7OmBlcThohq6rD6o3xFY86H5i1xR06buE38k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ym5cCLYysPkChS789Tp3dh9QW49yrE4NpXa0A4PZXqsDPd++9sxTiuUluae/sihUvJ75Xzmq43UNQlVbwFdt9bJzjmTnh+DlKe6vpdnOhPTGWfkTW1QG7xhelUHqMRbFB2OF8GdrnUBGe6p9HByPCDuEViL86UMS0GqMXgfYt8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZT1ehbo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZT1ehbo"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f752b3423so1493227f8f.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 22:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785562133; x=1786166933; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VGWLDg96xg9X2R8tFVFYr1K1sw/dzYhsye3xehVIvdQ=;
        b=qZT1ehbo8L8MKD9sblqbT/WT9s/j1lmPa4nnV9Otc9Wt08997+dyyotuzk2mPbE4EE
         GRo22iKMRuwAIYv084lDBcNe1pUuXE19cpXeS7CR9O1QHTqu0FUy2ov6+jma7AqB0ldi
         R/UpV8zULpjAcSDl0ph02sQ96SmL3xzfFDoCRgrpfJqSopTsQvDoMDH2k+ByaVAeQYvj
         4cKaW/KBQKmQSgjFuGiTmm5K9hpGPxk/G/V3T4slR478uzhwToPzC2z2dKq6td021uSF
         0Jep8PBPZQbyrHvuxnQhlFtrJsBiy81qhsp2qJFj/CzPTwxKkpRF7JbR8C/IcZzsFBxx
         qnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785562133; x=1786166933;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGWLDg96xg9X2R8tFVFYr1K1sw/dzYhsye3xehVIvdQ=;
        b=VYT1tp7ov3HOS+HOA6Es8gbK4ZGvjaOfujBXQ+y5n/ETczl6xkXhw16Cy5S8HyDwrJ
         1BsiugCKwIm+eQ6w6PJdyQjyvb5hD8FySLyIdnw8L2uI9zSEz6cbey8p7EIPu/76cKlo
         EhzP4oJywkQR9dDrFkDEDDfFo8O0BaWKj213N501wnYGRnA80KxSIwzOUHCQne1G9DyL
         Zijb2bpMSbDq4wYGIXvl8FFAfWz06p0ZGDMAkkDcs3cSsKS8qTXZWCp/deiDnNu1H/Rz
         bVQ74du2jUQFHhjvR0v86tOD/VJnhFP6fvHqZqSjQLjWQDa5eBPwGGpoZOEk09inOtWD
         vKzg==
X-Forwarded-Encrypted: i=1; AHgh+RoAfspLpyZEgIeBHCZw6n7BIe2njDwWlEHe76EHJ50l7A0DQu63gpNtqkXJtMLFxZJachwcbPNRR3PkzFXEOZc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJuRvooLiaX7HYeiVBoXZndD93McUN1C6cU5c0aOwxvh9a4gk1
	XAdJKyS3Du8Ppo1MX+jwQK6tGW0bL5wVoidSnnubTg0X/9t9YcvuHcpI
X-Gm-Gg: AR+sD13iP2VIWcfU9jqBRPrcwMm+kHCepPjQnBT+nFdBSoOd/Ajd/UliIFO73bJXY5S
	IRIgIYuzy0aSxWXKIyhl9vWSRiVKqsrm3yAYPM8M/NbyUDBqufb2gI47qRxoXUpW8SgW/lfw880
	AXgq6f6zkbw+vAo5Hp4SIK1wGMtmRJ6Jwur+n9MCesU6aJQ10FjfX66NeuMOV0lFOcWtQMLUU+5
	WFVqrJ2a5tc/++riKCbAn03iXgmxJhOc1hksCgxChZuWX2MtmiF/6ifwNVSdbnGTCydQxr/0GdB
	bmujrjllj/4PwScZmhNsEg+xbONcXctXQ8fRk/q0ByXIYxqsHBQoF6aKIlcgrxQbxkD6FUQfOke
	ng20MjvI/JB6gHNgi8nvq+iV+ZXJOqZrf+kZuQQqu2bfBLjmrJ3sRgrcTD6AW5IYabuP1I1ruyR
	oyPPH0fgZ93ePA47ss70O4Z5Z6twrbVqyJIDMdmyqkCFD5jUNO0PuzxSZhTF+PUYsswCq+390rY
	pnN499UrC3G8JU3epe4VvPEUOF6ZxYDEty6ixxEpbEQrNikc3yCSn+xfhcFvZzrHHPfDX0ARraf
	++MDH9cAgEt8mUd2u6uLvMxLiqTQ5Ls1lZSuNTHont3LfC8IoDNpVq3PtP1aVIs0Relk8hgVczC
	f95m5sikrlDL5QS9YMLfN4wNS6rpPCaBC7mtHyJoMHLsZYYg/xNj6NEImdyS7XQQ=
X-Received: by 2002:a05:6000:1946:b0:47f:56f7:7a57 with SMTP id ffacd0b85a97d-47fd7309159mr3519771f8f.28.1785562132890;
        Fri, 31 Jul 2026 22:28:52 -0700 (PDT)
Received: from systembl0wer (109-81-110-164.rct.o2.cz. [109.81.110.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2484sm13028897f8f.11.2026.07.31.22.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 22:28:52 -0700 (PDT)
Date: Sat, 1 Aug 2026 07:28:50 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 linux-iio@vger.kernel.org, andy@kernel.org, nuno.sa@analog.com,
 dlechner@baylibre.com
Subject: Re: [PATCH v2 2/2] iio: dac: mcp47a1: add support for new device
Message-ID: <20260801072850.6f5d255e@systembl0wer>
In-Reply-To: <20260801033013.19ef2b2f@jic23-huawei>
References: <20260727-mcp47a1-add-support-v2-0-d4591a2ce69e@gmail.com>
	<20260727-mcp47a1-add-support-v2-2-d4591a2ce69e@gmail.com>
	<20260727184226.DFC1E1F000E9@smtp.kernel.org>
	<20260728151559.000067ef@gmail.com>
	<20260801033013.19ef2b2f@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 1 Aug 2026 03:30:13 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Tue, 28 Jul 2026 15:15:59 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
> > On Mon, 27 Jul 2026 18:42:26 +0000
> > sashiko-bot@kernel.org wrote:
> >   
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] Potential off-by-one in DAC scale calculation denominator.
> > > --    
> > 
> > Responding to Sashiko's comment.
> >   
> > > --- Patch [2]: [PATCH v2 2/2] iio: dac: mcp47a1: add support for new device ---
> > > commit 38bec2fbb020c3f749c52a26e5cc3e78e72eeaf5
> > > Author: Joshua Crofts <joshua.crofts1@gmail.com>
> > > 
> > > iio: dac: mcp47a1: add support for new device
> > > 
> > > The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converter
> > > which communicates via I2C.
> > >     
> > > > diff --git a/drivers/iio/dac/mcp47a1.c b/drivers/iio/dac/mcp47a1.c
> > > > new file mode 100644
> > > > index 0000000000000..140e93ff2ba01
> > > > --- /dev/null
> > > > +++ b/drivers/iio/dac/mcp47a1.c      
> > > [ ... ]    
> > > > +static int mcp47a1_read(struct iio_dev *indio_dev,
> > > > +			struct iio_chan_spec const *chan,
> > > > +			int *val, int *val2, long mask)
> > > > +{
> > > > +	struct mcp47a1_data *data = iio_priv(indio_dev);
> > > > +	int ret;
> > > > +
> > > > +	switch (mask) {      
> > > [ ... ]    
> > > > +	case IIO_CHAN_INFO_SCALE:
> > > > +		*val = data->vref_mV;
> > > > +		*val2 = MCP47A1_MAX_STEP;      
> > > 
> > > [Severity: Medium]
> > > Does this code use the correct denominator for the scale calculation?
> > > 
> > > Since this is a 6-bit DAC, shouldn't the scale denominator be 64 (2^6)
> > > instead of the maximum step value of 63? Using MCP47A1_MAX_STEP (63) here
> > > introduces an off-by-one error that could cause userspace to calculate
> > > output voltages with a ~1.5% LSB scaling error when reading the sysfs
> > > attribute.    
> > 
> > Yes, the max amount of steps is 64, which should be passed here. I'll
> > add a separate macro for this in v3.  
> I'd just use + 1 at this location given the clear relationship between
> the maximum value that can be taken and the number of steps.

Good to know, for some reason I thought that this type of stuff was
discouraged (MACRO_NAME + x would seem messy in most cases).

-- 
Kind regards,
Joshua Crofts
