Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F3A3A3E69
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 04:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778734739; cv=none; b=AFKUkrhu0VVntH9ihTRZYZ0DPuwYpwDvJLCypKrCTP9zyNULNzi1FwPnT2LcOobWpWgqFIqTQp45V/eYHYfoTekg2orax6QHB4KQnNOIl59ZaeeFvRreOfN1tvFkhQ5o97RN+VcLR3l+O5VLVjKWNWyn2OJb5fmx1lUkMBD75Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778734739; c=relaxed/simple;
	bh=GyLKE/ObGiUS+GmBhoU0kNu2raSet2R5I1pqOXZEM3s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HXhPeZNtoKetvbk38fTX9GqqWTNQ8xNdtrxbeFHCOO15UavfqqNENQEJkzv6jgXWiM6XQ/oKG9hMtAJmrEFVBEAuGu539LaGsXrGNlvyeTtfxxv93r26bH9N+cKNaPBT31Eng7SWG5HrT0NBJ0YtRoKL+ommFKHwsaBF+9Fk8eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=HSrT0JtV; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="HSrT0JtV"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso1612304eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 21:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778734737; x=1779339537; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4E6xAV+ymnZaVvNz/6Cf5lX7tVpE5qIZhbUx7OqV4o=;
        b=HSrT0JtVsPzv5w/MqSEEKPBaaVwD7RDTHeZlCy/R4Lrx0/31rsrFfTjAMoVc6BuaWs
         c6DCcnCP8MtbY6McbOwgWGfPv1Vtw5GThB8FQfQ9Cc7Ycivb5KIiPdw/jyiFbYyYMf9O
         5rXuLv3kj3xvKdSi1ZhGC7oOQ/ufNNl21xpJGx0726UQZ6n2H5cGNffPs2L0BrdyeaPl
         y9feLlAsfvl92H84nQ2CZck87KLULCBk052zMBA7cL8KZOMPSvj7n8LSVwlLCYIIALvN
         mTok90MpyFKr/8bOe6+wQTUC3z9tiOiaXTTXrqZP4R2bxfxsLP+jsxyyn8DmNqPs8Z4t
         6CUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778734737; x=1779339537;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4E6xAV+ymnZaVvNz/6Cf5lX7tVpE5qIZhbUx7OqV4o=;
        b=mX3IDB0u5bsz+Iqnw7uc6IdxiU+za9zCtfFAx794sGLB2EyvfE6JDTqsDJMsq4Mg4r
         25VZX2oC+Xpcr/qwlqQBSxtYuFnh88aGXu2MYpm8Hng7BHyxF2/26L7Ch3ZATo/eacbr
         BgE1VBzlM6soGiJ5A9yqObYi5Q3mSRTkFJpnxafGFJGPt9CYrQPCL0AWew3nHqry9tDS
         lKcCFw9hi3yEyFdy2oP5YOH1y3vQm5qxDEvgaq5uSnNLodtm6rqJPgV7kD7RCBLCMIvq
         MoInAQPQnRBrJM2jjAd8IQ0rVmc2b7zIMrcfs0lwoA2/3Uli4bXFlKghl2VpZwJVi8jr
         /FWA==
X-Gm-Message-State: AOJu0YyILPL5oY6C2PsO6ZFr4GdHpwlodESi+V4ypYLWm2d3WGkjcAIN
	+MaV+YXy35TL7Nk285so6SvhuxH8+VuxKa7a5dtMmOiD848cDicFKUiCEfrwyLA3/MtZaeKV2FU
	ZclyfF/Y=
X-Gm-Gg: Acq92OH8TZE58IKqy2B7J/6dAIx1HGgXIYJ7rErsyYWKaRzwEYMCrGBvot2REdI1ssz
	nEHsJlirorWN0qI53SfTLtXOBWBeVHnXDrK4+FztxeWxgjW9kdXlg4Ng2cQQGyvB2x2NsyqH2UJ
	BpSlX6Ur0+mzjeiW+5R3YBObkkFVxU+JXcg6C3hh0MpuNhataWyft+ZU7l4wotdLxNiUS7ZYK97
	hTjldrHRoPPHiTJL1qR6fu4MsQ1S7tpcxwLWpdMOf7K2qZoXQG5kCAfrn5M1QLXuusfwRSpGE19
	k9RynOdUrsLZ124ZLm0lj8jl2naAzlLqON0gUxBvWXdtwglgGgrTkkEDnE/vjv93+b081WgiLtQ
	QZ62hD1ht2nVotRX9W7AW9DZHmas2T2j8P/2JemAooMjyocHlJ1xMXo8O3nG4tx0CHx4SFjoLEg
	eSmvNKsUsEhWwACBYqOIzBYls=
X-Received: by 2002:a05:7300:5412:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30117faa7d3mr3926686eec.3.1778734736576;
        Wed, 13 May 2026 21:58:56 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6e9sm1945150eec.16.2026.05.13.21.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 21:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 21:58:55 -0700
Message-Id: <DII4U8OGDPXK.2JJTHRE0OEGA5@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260512-adm1266-v3-2-a81a479b0bb0@nexthop.ai>
 <20260514004750.10B3FC19425@smtp.kernel.org>
In-Reply-To: <20260514004750.10B3FC19425@smtp.kernel.org>

On Wed May 13, 2026 at 5:47 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [Critical] The shared buffer `data->dev_mem` is modified and accessed i=
n `adm1266_nvmem_read()` outside of any lock, leading to data corruption on=
 concurrent nvmem reads.
> - [Critical] Stack buffer overflow in `adm1266_nvmem_read_blackbox()` cau=
sed by an undersized buffer passed to `i2c_smbus_read_block_data()`.
> - [Critical] Heap buffer overflow in `adm1266_nvmem_read_blackbox()` due =
to blindly trusting the hardware-provided `record_count`.
> - [Critical] Out-of-bounds write in `adm1266_pmbus_block_xfer()` due to u=
nsafe `memcpy` using an untrusted length from the I2C device.
> - [High] DMA read buffer bounds mismatch in `adm1266_pmbus_block_xfer()` =
exposes an out-of-bounds write vulnerability.
> --
>
> commit 2afefd44ddcfcdd2fe5f8721e42653261b4e9ff0
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry
>
> This commit adds a write-only debugfs file to clear the ADM1266 blackbox
> buffer. Writing to the file issues a 2-byte block-write command to the
> device. It also adds a pmbus_lock guard to adm1266_nvmem_read_blackbox()
> to prevent concurrent read/write operations from interleaving.
>
>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266=
.c
>> index 7b8433226176f..bd3784d59a7c8 100644
>> --- a/drivers/hwmon/pmbus/adm1266.c
>> +++ b/drivers/hwmon/pmbus/adm1266.c
> [ ... ]
>> @@ -379,10 +415,11 @@ static int adm1266_nvmem_read_blackbox(struct adm1=
266_data *data, u8 *read_buff)
>>  	u8 buf[5];
>>  	int ret;
>> =20
>> +	guard(pmbus_lock)(data->client);
>> +
>
> While this patch adds a guard here, does adm1266_nvmem_read() also modify
> and access data->dev_mem without taking this lock?
>
> If two threads read the nvmem device concurrently, could one thread's
> memset() execute during another thread's memcpy(), causing corrupted data
> to be copied to userspace?
>

Yes, this is a real race -- the nvmem core (nvmem_reg_read() in
drivers/nvmem/core.c) does not serialize reg_read callbacks, so two
concurrent reads of the nvmem device can interleave the memset and
memcpy on data->dev_mem.  For v4 I'll lift the guard from
adm1266_nvmem_read_blackbox() up into adm1266_nvmem_read() so it
covers the memset, the blackbox refill, and the memcpy as a single
critical section.

>>  	ret =3D i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO,=
 buf);
>
> Can this call overflow the buf array?
>
> Looking at i2c_smbus_read_block_data(), it blindly copies up to
> I2C_SMBUS_BLOCK_MAX (32) bytes into the provided buffer based on the
> length byte returned by the hardware:
>
> drivers/i2c/i2c-core-smbus.c:i2c_smbus_read_block_data() {
>     ...
> 	status =3D i2c_smbus_xfer(...);
> 	if (status)
> 		return status;
>
> 	memcpy(values, &data.block[1], data.block[0]);
> 	return data.block[0];
> }
>
> If the I2C device returns a block length greater than 5, would this
> memcpy() overflow the 5-byte buf array?
>

Yes -- a malformed length byte from the device would overflow the
5-byte buf onto the stack.  This is pre-existing in the original
driver; I'll send a separate fix patch with a Fixes: tag sizing buf
at I2C_SMBUS_BLOCK_MAX, and rebase the feature series on top.

>>  	if (ret < 0)
>>  		return ret;
>> -
>>  	if (ret !=3D 4)
>>  		return -EIO;
>> =20
>> @@ -392,7 +429,6 @@ static int adm1266_nvmem_read_blackbox(struct adm126=
6_data *data, u8 *read_buff)
>>  		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &ind=
ex, read_buff);
>
> Does this loop have a bounds checking issue?
>
> The record_count loop limit is read directly from buf[3]. If the device
> returns a record_count greater than 32, will the loop advance read_buff
> past the end of the 2048-byte allocation for data->dev_mem?
>

Yes; record_count comes straight from the device.  Pre-existing as
well -- same fix path.  v4 will clamp against the declared blackbox
size (32 records) before entering the loop and return -EIO if the
device reports more.

> Also, could this call to adm1266_pmbus_block_xfer() cause an
> out-of-bounds write?
>
> In adm1266_pmbus_block_xfer(), the memcpy() uses a length from the I2C
> device:
>
> drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
>     ...
> 	memcpy(data_r, &msgs[1].buf[1], msgs[1].buf[0]);
>     ...
> }
>
> If the device returns a length up to 255, could this write past the
> expected 64 bytes (ADM1266_BLACKBOX_SIZE) allocated for read_buff?
>

Yes.  adm1266_pmbus_block_xfer() memcpy()s up to 255 bytes into a
caller-supplied buffer whose size the function has no knowledge of.
Pre-existing; same fix path.  The fix will add a max-length
parameter to the helper and update the three call sites to pass
their actual buffer size.

> Additionally, does the DMA read buffer size in adm1266_pmbus_block_xfer()
> expose an overflow regression?
>
> The read_buf array in struct adm1266_data is sized
> ADM1266_PMBUS_BLOCK_MAX + 1 (256 bytes). However, the i2c_msg length is
> set to 257:
>
> drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
>     ...
> 		{
> 			.addr =3D client->addr,
> 			.flags =3D I2C_M_RD | I2C_M_DMA_SAFE,
> 			.buf =3D data->read_buf,
> 			.len =3D ADM1266_PMBUS_BLOCK_MAX + 2,
> 		}
>     ...
> }
>
> If the hardware sends a full 257-byte response, will the controller
> write 1 byte past the end of data->read_buf?
>
>>  		if (ret < 0)
>>  			return ret;
>> -
>>  		if (ret !=3D ADM1266_BLACKBOX_SIZE)
>>  			return -EIO;
>>

Yes -- read_buf needs ADM1266_PMBUS_BLOCK_MAX + 2 (257 bytes) to hold
the length byte plus up to 255 payload bytes plus the PEC byte.  The
subsequent PEC compare,

  if (crc !=3D msgs[1].buf[msgs[1].buf[0] + 1])

also reads past the end of the current array for a max-length
response.  Pre-existing; same fix path.

In summary, the four pre-existing buffer-bound bugs (points 2-5
above) will go into a separate fix series with Fixes: tags sent
first; the nvmem-read race (point 1) is folded into this patch in
v4.

Thanks,
Abdurrahman
