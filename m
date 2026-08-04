Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B023A75A8
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 20:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875417; cv=none; b=KP3+ekZRXhGWBGs7GV5mkbw9R3FfkrdWNKm9dcKVKgqQ2nk+McgQYB4D+uvN20Tke+hxKeptaati3b9Ypm+sxeFGBSRHhtfxVIDmssJLnx7UDmJn0vInJqpGk8vF2/DxOSi6dX+9IixiwI3iEMDGFYDzO+WYT37HvBdzlvy1z3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875417; c=relaxed/simple;
	bh=pAL7Jt7JEoG+sXUktWsb3YcHGphg8fKAkAB08qgNi5w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GP1QhCNRhgRe6IOdikG5YIEZ2cGaZOKrrpDwKX1k7NNORbA0LKFDXuoAe7NBc4PFDR7zTdpNAXUAyCSTIyhHFkkM21yzgfwZLZlEjSvgVtv3sqJJDbxoVzZBq0iLL9pH1i+LpjptzqwZeJx9lPtPgQB1YZjDd8x4+sFo/h8Foy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUAr7UuL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUAr7UuL"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso2575255ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 13:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785875413; x=1786480213; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMK58JoOn7YGNS7NZv+R4Qi006QH3IO2iTxFSl8Hiwo=;
        b=SUAr7UuLw3VDq57H1uojvR7b9R0FX9R2Pzff/iXoTX7W1I54ZS2cwkgTQyrFdmDi0N
         uSlDiICxB5QBo3EsyFk/0pS5BdwwF3l5kjUTSEB7e6vTgs5d3VElkjyoUp/JRA98demB
         Pfh1VPvWpb+U4Hg2JsT8Lre60JtP/670WUzFjnDBoWeO0qn27GfGf0QSYtq6kmXdcaZA
         PeALF3CgxHqUSu5kecGq1JNwACve6S++IzuioSoVvtzdSNkas/2LE+FuShvd0hjaPt7n
         zyC/Uc0twp43BegCeMMwXdHk7djgxeQFewt7nlCJms0g/m5xJL4dWQiflduvGjWRN5ag
         MolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785875413; x=1786480213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HMK58JoOn7YGNS7NZv+R4Qi006QH3IO2iTxFSl8Hiwo=;
        b=pLdOKF4kG3c0GuTDsX7sd9pQTvUvZnwgRFoxWvLXNmslGaG/fF+lzp1QFXgLoEuLOC
         v0khM1PnLTNjQbNfvjNWNeJvrCzhEKItzKZgDgnoUBDJo+jnw8dxdFJPyv7OnfsQk6zt
         VIgd13LxksJ/y+w3CGvLF49kkZd4XYsEKJsZLQE201c+51Fzw7izyHFDV/xjHZ1vydkS
         Ssw3pln9bV/FAag3tczMmsAlArplfzlc5QxBmOkiMbrc0++Upwp4iyibEaiuVcBOWXmL
         5o3X+GzRZ0LrnGS9iLFZ+yNxdu1aPuJg9oVyGFJyzSPieXvRiUMwvSrVyKnjP8zYlwOV
         AifQ==
X-Gm-Message-State: AOJu0YwNFx85TF0tLY7Jh5XXyw0/HV97Lq4TBDHlnKlAi8AAiLhpapkz
	TRIq/9nTfB6NVSRKQZWHrvXYV79O7aOQIwC0RKNKQZwnfDS91DHgustnZPskHpyV
X-Gm-Gg: AR+sD11DfJleD70P71yrku63e61CdI6BUqGAQosEmqdstYUBbAAfTUxGqv3tZLilF0e
	3JgTqX3kM6PX/ZD/dvczQ3SywHP4kqx3Uv+gscVt+K4QBws6lnNokzVrMUUaDRb+dPoX/iBGlQ6
	AZRdVkuB2RpaQkLE81FEAqKqELcwlcBoHDBnpPUTm+0c0MfAGiYy7slUxmKCl85CRrOdohLnVT8
	Zm+VVgDOimlW4Z1t3q8uwuNYohQWVVbp6QY55cXOeBlYivqQgizsXjAVTo7otPB7PX2a1GJBltS
	c/osnC//M+/Dc4DOp6j/FEPp4fQ1AFeKiTlQTG8c9WJ2W6r3xsN7z+xBLDi9uDTSRsTgj/SpoEl
	rN24snOYcRmuF+5SA8NKaRch7OlTwlk0cB2hZcOtLHENIXBwEBrARHaILLx/55thnLnfzFOgbpM
	6Kx32lQZcICZDr5WPL00nf0LZ3PINkhP6rTjIs+GRZWCgCF7xHKeRxGz6e
X-Received: by 2002:a17:90b:5823:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-3903c5b727cmr1313940a91.15.1785875412933;
        Tue, 04 Aug 2026 13:30:12 -0700 (PDT)
Received: from cxlqual ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfdae78sm1969930a91.4.2026.08.04.13.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:30:12 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Wed, 5 Aug 2026 05:30:43 +0900
To: sashiko-reviews@lists.linux.dev
Cc: Anisa Su <anisa.su887@gmail.com>, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v12 2/8] cxl/mem: Read dynamic capacity configuration
 from the device
Message-ID: <anJL81OcYeZn0BA1@cxlqual>
References: <20260731084901.1512819-1-anisa.su@samsung.com>
 <20260731084901.1512819-3-anisa.su@samsung.com>
 <20260731090106.1472D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731090106.1472D1F000E9@smtp.kernel.org>

On Fri, Jul 31, 2026 at 09:01:05AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] False-positive error logging and initialization failure when a device has 0 dynamic capacity partitions configured.

Incorrect: Table 8-346 says "A DCD shall report between 1 and 8 regions.
All other values are reserved". 0 is illegal so failing is correct.

> - [Medium] The validation check `is_power_of_2(blk_size)` truncates the 64-bit block size on 32-bit architectures, allowing invalid block sizes to pass validation.

Fixed. is_power_of_2(unsigned long n) indeed truncates on 32 bit. Replaced
with (blk_size & (blk_size - 1)).

> --
> 
> --- Patch [2]: [PATCH v12 2/8] cxl/mem: Read dynamic capacity configuration from the device ---
> commit 7a0233410b5ae133da2a756fa11cf61b2145cace
> Author: Ira Weiny <iweiny@kernel.org>
> 
> cxl/mem: Read dynamic capacity configuration from the device
> 
> This commit implements the Dynamic Capacity (DC) mailbox commands to read
> and store the DCD configuration information from a CXL device. It reads
> and validates all partitions but configures only the first one.
> 
> > diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
> > --- a/drivers/cxl/core/mbox.c
> > +++ b/drivers/cxl/core/mbox.c
> 
> [ ... ]
> 
> > +static int cxl_dc_check(struct device *dev, struct cxl_dc_partition_info *part_array,
> > +			u8 index, struct cxl_dc_partition *dev_part)
> > +{
> > +	u64 blk_size = le64_to_cpu(dev_part->block_size);
> 
> [ ... ]
> 
> > +	if (blk_size == 0 || blk_size % CXL_DCD_BLOCK_LINE_SIZE ||
> > +	    !is_power_of_2(blk_size)) {
> 
> [Severity: Medium]
> Could passing the 64-bit blk_size to is_power_of_2() cause silent truncation
> on 32-bit architectures?
> 
> is_power_of_2() takes an unsigned long, which might allow an invalid 64-bit
> block size that is not a power of 2 (but whose lower 32 bits form a power of 2)
> to bypass the validation check.
> 

Fixed:

	/*
	 * Block size is a power of 2 and a multiple of 40h. is_power_of_2()
	 * takes an unsigned long, which truncates blk_size on 32 bit.
	 */
	if (blk_size == 0 || (blk_size & (blk_size - 1)) ||
	    blk_size % CXL_DCD_BLOCK_LINE_SIZE) {

> > +		dev_err(dev, "DC partition %d invalid block size %llu\n",
> > +			index, blk_size);
> > +		return -EINVAL;
> > +	}
> 
> [ ... ]
> 
> > +int cxl_dev_dc_identify(struct cxl_mailbox *mbox,
> > +			struct cxl_dc_partition_info *dc_info)
> > +{
> 
> [ ... ]
> 
> > +	do {
> > +		int rc, i, j;
> > +
> > +		rc = cxl_get_dc_config(mbox, start_partition, partition_count,
> > +				       dc_resp, dc_resp_size);
> > +		if (rc < 0) {
> > +			dev_err(dev, "Failed to get DC config: %d\n", rc);
> > +			return rc;
> > +		}
> > +
> > +		if (rc == 0) {
> > +			dev_err(dev,
> > +				"Device reported %u partitions available but returned none at index %u\n",
> > +				dc_resp->avail_partition_count, start_partition);
> > +			return -EIO;
> > +		}
> 
> [Severity: Medium]
> Does this code incorrectly fail initialization when a valid CXL device has 0
> dynamic capacity partitions configured?
> 
No, such a device is not valid. CXL r4.0 Table 8-346, Number of Available
Regions: "The device shall report the total number of available Dynamic
Capacity Regions. Each region may be unconfigured or configured with a
different block size and capacity. A DCD shall report between 1 and 8
regions. All other values are reserved."

So 0 is a reserved value and failing is the right response. Note the
distinction the table draws: a DCD always reports at least one region,
but the regions it reports may be unconfigured. An unconfigured region
reports zeros for decode length, length and block size, and v13 skips
those rather than rejecting them, after Richard Cheng raised the issue
on this patch.

Alison asked separately for the count to be range checked, so v13 also
validates it where the payload is parsed, before it is used as the read
loop bound:
	/* A DCD reports between 1 and 8 partitions */
	if (dc_resp->avail_partition_count == 0 ||
	    dc_resp->avail_partition_count > CXL_MAX_DC_PARTITIONS) {
		dev_err(mbox->host,
			"Device reported %u available DC partitions, expected 1 to %u\n",
			dc_resp->avail_partition_count, CXL_MAX_DC_PARTITIONS);
		return -EIO;
	}
A device reporting 0 now fails there with a message naming the field,
rather than reaching the rc == 0 path you quoted.

- Anisa

> Since this loop is implemented as a do-while loop, it will always execute at
> least once. If a device has 0 available partitions, it will return 0
> partitions (rc == 0), which causes this path to log an error and abort
> initialization with -EIO.
> 
> > +
> > +		num_partitions += rc;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731084901.1512819-1-anisa.su@samsung.com?part=2
