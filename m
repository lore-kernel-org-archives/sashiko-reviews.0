Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12434C815
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 05:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785907396; cv=none; b=nYxtYeoQshDJ13LZbLE1mQfwIS3WfbA1ud2wwCGk6XmGxrHrtXufKawUmggzIIc9kVlwRWl4F4zw8Pqrgy8oRsPmAPkX7CyEmsFFU0Pa/lwXi2ljr+AYg8eAj3hqZLyMKM7WLpyvrxK0DIYVYcjSCG2yfUXUJgkDU1BgTpsIQ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785907396; c=relaxed/simple;
	bh=xRygjBeqtl3DM1YUyTSX+xTymVDkqZSb0c/0pboomaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9gLMW+ESyvaUYnC2EcEAkK2fA3SOScswoYIv6SxUxSBx7RaYMVgGTfIYB23d7/BAG9yT2umnLMriaAnp6jO1wGDqmNENnPHQRlsiI3xrSFQ0501lu/xOaFmN3KJW2DLvycCuQemgteoJdROHA2vCHATFseazT4E/lZAukWZYEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErgwxZnY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErgwxZnY"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84a2c90e383so1359321b3a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 22:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785907394; x=1786512194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/HdM6bUtOuLf4vaeZ3R2Sq1G301/DGdLSrA83VIFE5Y=;
        b=ErgwxZnYrrlp6zwbdwdQ1dRyQpcjOi1evj6Nbpv2cI3xJdC+u0JMtVs1zL6dX1DoYc
         h17V5FZCVB2uD1LKHj79lsvZZ7n8LTBPfJCtUFGX4c+EIutVJk/tfaBNcHOqgJfrAYFx
         O9UDbdV/y8d1w/uLUUyMWnb0zpGQQDB/fC1xAdythhpTBCXs/b1AXvuyPMESmQMK+3VT
         Gv6HYWxYutUXVVJjrfNjGZcLDfngtLOR+i9qxOATebEDQPNprRQoAHu1GTju8jKTHtj0
         ASoy1GFqNHIDrq0MhaqXbLX6LjCi5MTPSVwr7hXsrre0ZbzIVqNanzwrpat7tBENaZmv
         Lv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785907394; x=1786512194;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/HdM6bUtOuLf4vaeZ3R2Sq1G301/DGdLSrA83VIFE5Y=;
        b=A/cXte4nRZj0vfDFi+1Bsq24fBZZQqc+GiVkOCXHLnezJGc9HHVpchhgJfGISojpsE
         oe4bmEe5N4Z1y8o5wz5j7yCg/hJUNw/j+RHUYBeZEuhVTs4smSjokeRgXwx2hviARm+V
         xg6Yq9jEUK5AZtKUII9MR5WBQCtXOqXbzWOc9G9oK5Bas7jnL0iighJXmOlLZRrMXtP+
         ZsDJDiEUGwdgqc3QEDfxfXLX138CfJN7e9tG4TPS887nPXIiJnI9RhJZ3xjvCBc9K6l/
         O8tXEp5Wz4hsZ3U5O9UDnhYa7uWxnumvbVR0b8bjYRj2NzSW2dF1DlB9e1vLpWwS2ayV
         p92w==
X-Gm-Message-State: AOJu0Yx0d4hL86JHL1oeuklhvRyPY63B0DI4lW626l9k2GXls+FymTJC
	PKiJl+u/BgSzb9/TweZowwIdyXyAFD6in7K3KP3txUdrgoV1DC5eCcRshKRg2Q==
X-Gm-Gg: AR+sD13N1J22qHbQkAb4/DsBTVXGjR/005Rj05dyhy5LWeUEiSr0giY8r36pDS5tlTt
	DVbrbCnq4PyEw++yEoyI30AeZWah+cBkscT88CNuPiVXotY3azvvIqT1uRMqcnHQC/IPQElJmWW
	rGEtLvdAj4YHvmoBADVCIB3uYuDcnvuQLf8IZCYck4lz7pYgRum5J9KHHY1ZlZ3KN0hdw/mYmYT
	8uwLKWZY/4RrzVQQiETnFCdPkdMoWv/lEVwQDNeDJsAg/Uhf9NO4INUlwhdpjuuCbHQNi0s/7mF
	W9VKR9Mw/UHEQUgxHTKC2sk1hTYJomdKnfPb5nY+9XnSVA4FN1vlohVkMNo60guTs9q5OOQqbM9
	fr4ST/vFuYFwFN51CDn8/EJoyMXCdjGkmunlLFy3spMbKtnrcuc7xbMYoc1CR4VkYLZpuw2K94x
	T8G1gI0Ltq5aZAWgkl628+Osy9tdIOfBdtCF48Hun1jXcxdMWQW1ioYhkWqNgM5UTKLuqbHGedh
	L/GVjxicNK7kLpb4onXxrZfsD2sYA==
X-Received: by 2002:a05:6a20:a11b:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3cb6c9c179dmr9314476637.19.1785907394406;
        Tue, 04 Aug 2026 22:23:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf3a:ac93:79c4:84fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be99sm20448477eec.15.2026.08.04.22.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 22:23:13 -0700 (PDT)
Date: Tue, 4 Aug 2026 22:23:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: rmi_smbus - fix out-of-bounds read in
 rmi_smb_write_block()
Message-ID: <anLImeKU7fGoyRQz@google.com>
References: <anLFSMKSoKyyZ272@google.com>
 <20260805052039.C1CA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805052039.C1CA21F000E9@smtp.kernel.org>

On Wed, Aug 05, 2026 at 05:20:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Pre-existing stack/heap buffer overflow in `rmi_smb_read_block()` due to unsafe use of `i2c_smbus_read_block_data()` without a bounce buffer.
> --
> 
> --- Patch [1]: [PATCH] Input: rmi_smbus - fix out-of-bounds read in rmi_smb_write_block() ---
> commit 530e4667b6144c7e030412bbc818f1de86a5a09e
> Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Input: rmi_smbus - fix out-of-bounds read in rmi_smb_write_block()
> 
> This commit fixes an out-of-bounds read in rmi_smb_write_block() by ensuring
> block_len is calculated using the remaining length (cur_len) rather than the
> original total length.
> 
> > diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
> > --- a/drivers/input/rmi4/rmi_smbus.c
> > +++ b/drivers/input/rmi4/rmi_smbus.c
> [ ... ]
> > @@ -148,7 +148,7 @@ static int rmi_smb_write_block(struct rmi_transport_dev *xport, u16 rmiaddr,
> >  		/*
> >  		 * break into 32 bytes chunks to write get command code
> >  		 */
> > -		int block_len = min_t(int, len, SMB_MAX_COUNT);
> > +		int block_len = min_t(size_t, cur_len, SMB_MAX_COUNT);
> >  
> >  		retval = rmi_smb_get_command_code(xport, rmiaddr, block_len,
> >  						  false, &commandcode);
> [ ... ]
> 
> [Severity: High]
> This is a pre-existing issue, but since the chunking logic in 
> rmi_smb_write_block() is being corrected here, does a similar buffer overflow 
> exist in the read path?
> 
> Looking at smb_block_read(), it ignores the len argument and passes the 
> buffer directly to i2c_smbus_read_block_data():
> 
> drivers/input/rmi4/rmi_smbus.c:smb_block_read() {
>     ...
>     retval = i2c_smbus_read_block_data(client, commandcode, buf);
>     ...
> }
> 
> If a caller requests a small read, or if the final partial chunk in 
> rmi_smb_read_block() has less than 32 bytes of capacity remaining:
> 
> drivers/input/rmi4/rmi_smbus.c:rmi_smb_read_block() {
>     ...
>     retval = smb_block_read(xport, commandcode, databuff, block_len);
>     ...
> }
> 
> Could a malfunctioning I2C device returning a length greater than block_len 
> cause the I2C core to unconditionally copy up to 32 bytes, overflowing 
> the databuff allocation?
> 

Yes, but I hope this can be addressed once improved version of 
i2c_smbus_read_block_data() lands.

Thanks.

-- 
Dmitry
