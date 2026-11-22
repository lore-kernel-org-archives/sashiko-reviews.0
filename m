Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364694;
	b=L7lEVrp4NLUXc1l6QL5zHPQmdHGLfhilH44k5nEO0D3uNOEA5JcnAZFwxB507K7qbWVg
	 DGCsPz27K7Z71O0XsL/7mZX0l34D+9RYBsPyAkc2R0XJM8Hee/XP2OJ3e22loLkQa5G2A
	 wtX6Givapj5lvWb1+Zg7G0FBCKQDyMjCgJkvsPk0aGlW8BQV/KV8xx+rT5hWqcPaA3A0x
	 +mgtxG25K3dzuK/u6MNjqlCpFfxO3NGcuoMZHg4YSt9pdZ8FNcz8GxZuBa2U3+OU04okE
	 tUxt49sYPkzGowk6JRm/Bnm5jJphK0PmvmDE9NNwH2tV6dgJmAQA/GziqyzfR8MdhFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364694;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=e55ONnD4lN/W1mLTAULwKHmeI6PFxlZPHxsrxUS/5KQ=;
	b=e82Ctx/ZJ1g3lWzv3Xzsoa4Z5Rx4i1ZbZcDf/yRZVEtafghveskB1Krbddv2FBfrPvKe
	 eWSg5TT2mjj3vQdEDJ6OkiPiSrxULnULLJvtpizqvKFKXYc3445z6G858gvd0xbs5Xakc
	 MT6RQIEn48f/N65eKuWdDmttoQPKTaKoqqR45SyhZ9cojv2lEKvz+ftvdSShu/ToyhszR
	 L4R49ZPfyWj0a0mNYYy/mmFcKComF9ZXzeoz9+kb+pd657vkn038Mzm8+3J+dL/gZr2X/
	 zBjwzFDOy1zXU3zaRIG+8iFAif8aFctR+ETPM19vczXvHC2shgmdXy0YDcoy91kD1nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=1+gp1D4j;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE813606A320
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 16:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE813606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=1+gp1D4j
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id VA97xrlaY4vCDVAMxx3rw2; Sun, 22 Nov 2026 16:24:47 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VAMwxUSyRYskhVAMxxbNz5; Sun, 22 Nov 2026 16:24:47 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6b03174f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=Ikd4Dj_1AAAA:8 a=j61DXMuQjnjkn-ayxwgA:9 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=e55ONnD4lN/W1mLTAULwKHmeI6PFxlZPHxsrxUS/5KQ=; b=1+gp1D4j7mGS
	KwoFzxKCD7Y3EigdKtinsiXynYVQAiwYXAaMYhl2N6qg7fmLhLCunf9gYcCK2oLb6FRt3Dptf/mUZ
	1GJx+1kqcxGPsH/X6/ealfrRlHVh/pyyeynggQ94iS5IwvRXmjtP9fW/sIZxk8tqJ9K+UNohp4RyU
	NugWzYnZA75Xq0O+GUs72wf6GviT3wDAN7tqNAvfSkv3O+i2G10tn88nIvFtnp1JjIHRWk9uLvEG3
	B2oQBEMyILzv9R50EEH94m0OdE54t+0MKkzL7aEUn9I3EX3Wbjgx70rp9i1rjSzyGQD0lyiE0QJGB
	Yy88jCBsCcUbJsEK/BeJoQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40024)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVAMw-00000002bU1-3FDS;
	Sun, 22 Nov 2026 21:54:46 +0530
Message-ID: <fc18abfd-9bcc-415f-84d4-255c16faf022@roeck-us.net>
Date: Sun, 22 Nov 2026 08:24:46 -0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: (pmbus/core) Invalidate cached page and phase
 on failed change
To: sashiko-reviews@lists.linux.dev, Felix Radensky <fradensky@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
References: <20261122073322.1712843-1-fradensky@nvidia.com>
 <20261122073322.1712843-2-fradensky@nvidia.com>
 <sashiko-outbox-227794@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-227794@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVAMw-00000002bU1-3FDS
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:40024
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 12
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIr2UGtY1xW8OtKXX5G+bQ60w7TvatWjB9fg1CMOGFLDESMNO9qx0hBLROBPFGt4u9DSeU1TAhsC+o84asGzP+Rt2iyb9n/4vy1eDQhEa6FTAfCh89bN
 Jt3n4s4L6dsIssIlxLAtK+AhM0G/cNZF6JMTNnJCWZPGX9Skyy1Dwz78hA1Ywx8BUtOnhPGjUc5kIPnDsxVCZTMhgHnW66+izG1nc3KejO1x0rW8XxelTxMT

Hi Felix,

On 11/21/26 23:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] hwmon: (pmbus/core) pmbus_set_page() updates cache outside
>    conditional blocks
> --
> 
> commit 03751a48b86432f4503eb9a4970150b29ef4ab2c
> Author: Felix Radensky <fradensky@nvidia.com>
> 
> hwmon: (pmbus/core) Invalidate cached page and phase on failed change
> 
> This commit resets data->currpage and data->currphase to -1 in
> pmbus_set_page() before issuing PMBUS_PAGE and PMBUS_PHASE commands so
> that a failed transfer forces a retry on the next access.
> 
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 82dac2c6c579f..dae56e2e6f21f 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -227,6 +227,9 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
>>   
>>   	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
>>   	    data->info->pages > 1 && page != data->currpage) {
>> +		/* A failed page change can leave the chip on any page */
>> +		data->currpage = -1;
>> +
>>   		pmbus_wait(client);
>>   		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
>>   		pmbus_update_ts(client, PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE);
>> @@ -246,6 +249,9 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
>>   
>>   	if (data->info->phases[page] && data->currphase != phase &&
>>   	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
>> +		/* A failed phase change can leave the chip on any phase */
>> +		data->currphase = -1;
>> +
>>   		pmbus_wait(client);
>>   		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
>>   					       phase);
> 
> [Severity: Medium]
> Should data->currpage = page and data->currphase = phase be moved inside
> their respective conditional blocks?
> 
> Because both assignments remain outside the if blocks:
> 
> drivers/hwmon/pmbus/pmbus_core.c:pmbus_set_page() {
> 	...
> 	data->currpage = page;
> 
> 	if (data->info->phases[page] && data->currphase != phase &&
> 	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
> 		...
> 	}
> 	data->currphase = phase;
> }
> 
> any call that skips the SMBus write still overwrites the cached value
> (including an invalidated -1) without programming the chip.  For example,
> on a multi-page device where page 0 has phases and page 1 has
> info->phases[1] == 0 (such as tps53681), if a phase change to 0xff on page
> 0 fails (leaving currphase == -1), an access to page 1 with phase 0xff
> skips the PMBUS_PHASE write but sets currphase = 0xff.  A subsequent access
> to page 0 with phase 0xff then sees currphase == phase and skips sending
> PMBUS_PHASE, accessing the wrong phase on the chip.  The same happens for
> currpage when accessing a page with PMBUS_PAGE_VIRTUAL set.
> 

Sashiko has a point here. Previously it didn't matter because currpage/currphase
was only modified after the command succeeded. Unless I am missing something,
updating both inside the if() blocks does not have any negative impact because
the other conditions still have to be true for a value to be written to the chip.

Thanks,
Guenter

