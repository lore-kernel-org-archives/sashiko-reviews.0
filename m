Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B45013B9
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076913; cv=none; b=bplQ8W4h3IvCswLX8u53KPgC2lKajjzZ0ihx1yt6hBygPxqWXUebTHCUaiJqoTAirYIuOo2SMDh613Z9+KapliJAZNekD329MzjhbTJA0bG0kJDXfU1Jcx+bhzGN4i5/YeX0WKeCdivtgH3Fj15zrwsZY7A1PKczj2YXmlwlaWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076913; c=relaxed/simple;
	bh=Iw5b7BS1FDDHWnwCtsrafbx880S4JhedS7YTLxxZ/JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8BriwltesZ4k3A4DuvJPSWau9iC1hTbSeh12Lv/tPjf2ehapQyJsi8GscFivHbMZHcrZ0HW8L7RW0YoX95gDbB6iGN2LuoV7wNkR+t5Q+rhKJkIYu7K0izFHykP2YX/7zyp1jO/iDGIISEJnCSZCUot2EWJCQgJiggShoJuRS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=NLrmGITT; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DYiKvZcv; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="NLrmGITT";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DYiKvZcv"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEY9sU1621595
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 11:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ehfL
	YJwa3g7g3wT5mmEqYN0XViiWIyJQPYm2+5YbMss=; b=NLrmGITTeTXOHwhcBKmt
	VmRQkoTrCcj9+SfYtzFeC5lVmyxneX+pHiHHK7+yE7srhiOA7vk8WFaCrgcDouXT
	5EqSppccNzPXGeKwqIpQyGyt2deLXu8WVc5g1Cvj31TdxZgGdjaFR/UNauxiXzB6
	ymHzV63pDi9ffEdZfyRLKCzoVUEnETjx4J3YfVJbJfh4V4yomcpg3cTaclnIYGso
	z+M38QyROYV2TT5/lecfDiv3g6wEAMjuFS96wT0fR6M+3T3tW5yyRcZHK52DaxSq
	sUG42IUOxhe1DBIxeq+nI9b5z61CScc3JhNDjCtWweNGb8xxHezvPtweU3koOPxO
	Rw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hah8ew5xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 11:08:30 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so1086392785a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792076910; x=1792681710; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehfLYJwa3g7g3wT5mmEqYN0XViiWIyJQPYm2+5YbMss=;
        b=DYiKvZcvElQIRXUHDcre7Tl46rcwari2tJ+CVabRkrgQs2B55cfaH+dtrQzHLCYl85
         wEARU7fLGS/zDxW7IYUEZDvsL9KbTqaIz73lkBt4pvH9GCcjGuFOwKhgrhpG4S+ul+cr
         Rrw3JIQeiXC88NKSS5iKr3St9DBo1cerz/l/udEVaLVPS3Zef092c15hNCK9dMhM1eyM
         Zy5eeF+aajKNKtrOVzqNfbMnfx6IiODY2pUPqln1rxQfS66bTi5DnPS6B8Do0sTpxEXs
         X+qXio9rnRyTrACha5fPoRNaLYZD11R8ar4p1qlUMksw8C7lT9+xleHxt1KaZ3a1yiag
         T76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076910; x=1792681710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehfLYJwa3g7g3wT5mmEqYN0XViiWIyJQPYm2+5YbMss=;
        b=mkVm0yggT16KammxE2s6aIE/LNs+MsBDv1yB070ukJxv3L16dBnOPSmjxx6k3JeKuF
         OCpi9TmTngXbfWzoU44aQlkTa4+b9mAaiBTXgfkI/LbNIW+PTd3DdV9cl7Vb+RhiTvEd
         fn2FG6tIJqQXisH5JM0h5cNzp0Z47RxNlU2EGcsewSCGwrBJDWm1pXzq3vdyC5ii5MGS
         bR2znPJz2PVi00j4R5guq9yR2YWjo9sE5sAdaf0Z9PAP8Q0uKL6u5WUun0Z2hNMyYhEO
         oC9Ko79LcrJiuZ+7ux4VN5xzWqHlZO8r20rR+ydtIZtmMp4nyG1k0HeqiyV/lsvAOzxS
         lAYw==
X-Gm-Message-State: AFq9FYITqXmsy96eoJC7CUAZ8RB49SdHEdTpUBEWZj6HPVLTy1QytHP1
	I3vJQIrdCPljMdqDLl2wgCxMkRm/AaiP89W0gdwYyNIOpgU6XWyam//VgL4+SL6gnFgzTAxzwYw
	7ro3m6epLdvn8Ph6A376Eac5KpR3pghzQydsidkMPJCJHE57bjCJytVPgmXWgaJiYdQKViqYKrQ
	==
X-Gm-Gg: AYBFou0sjZ0Lj794YgwTYCqRl5y1UcRiHr65Mt2GJDJkDXbMfAztHrP1D8rPGOqV/VX
	7qcPTSTsEHL+u5BQKUBvwhtDQB85K+UMchqHB3nmJnX1KPpdbqImCiCYskFBd4oEDNZpSLr4f/Q
	MtO0gDtuA7chKiQwpeSRTZOzjzyu/+kWtEKmCfLglJ99kxskDhVr6zIL6z7qu557zOw1P/SwWSs
	4YjPRF629OWeycDIbwWHpHqRMkjj9MlMvo+1WL1UxZeBlscvvmPkR2zCgmNbv7rpQpkjryeEFNa
	yY0Nxils/HbHFTUsdxYFzjm0MlUkjEhWVBdt9nBVrfUV71gUALBX50XknTdH03MAi2d73Qxbun9
	o9+3zMQyZ2iUnWoxC3K09RZ4pfZYXbcrC0F5oZNwpsX65ww==
X-Received: by 2002:a05:620a:2254:20b0:93f:d30:6aac with SMTP id af79cd13be357-93f0d306b3amr341387385a.75.1792076908382;
        Thu, 15 Oct 2026 08:08:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2254:20b0:93f:d30:6aac with SMTP id af79cd13be357-93f0d306b3amr341379285a.75.1792076907641;
        Thu, 15 Oct 2026 08:08:27 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef500973asm785388085a.15.2026.10.15.08.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:08:26 -0700 (PDT)
Message-ID: <90cba2d3-a185-4bd0-bf8e-faed40bdb1ae@columbia.edu>
Date: Thu, 15 Oct 2026 11:08:25 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: rawnand: nandsim: use a NOFS scope for cache
 file I/O
To: sashiko-reviews@lists.linux.dev,
        Miquel Raynal
 <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org
References: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
 <20261014-nandsim-nofs-v1-1-47e49f37e387@columbia.edu>
 <sashiko-outbox-172202@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <sashiko-outbox-172202@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lttFkOGseG65MFE_AWRYrp9591ZJvZYV
X-Proofpoint-ORIG-GUID: lttFkOGseG65MFE_AWRYrp9591ZJvZYV
X-Authority-Analysis: v=2.4 cv=Ob8NnRTY c=1 sm=1 tr=0 ts=6ad0ec6e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=JUG9QDwV30nwqC0Dl2EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2MCBTYWx0ZWRfX0sLFDr2VHRL4
 Zzsu9VXAeJvKxpUt4nTY9GxicVpxHrf8PNMl/3h+aGYdve/Hj/kI998v5E+Nv3Gkex+SVZHkp8q
 iqhMFZcfOhKno3xgN2ET4F6QnySSvMrSKAtn2C4MA98cu8aaOEle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2MCBTYWx0ZWRfX+XvwaqPJvjPH
 Sff9vw2Vhv0xoo9xjIbUytSa7EHpr6R6M7diJ3TplxAY8D+FtKg0xCl254x0FHT8L7pWqFjsEiQ
 +i+7R5sJUm8ZbfiY6X8oSUIY5DlisQrcpSHmpsc7Ul8qVGlsbmO/FAvoU8gLjx4Ss97V/on6qxC
 7KGoN9G/fPbJUNdcTCmUBFQ5c0mSblZAb3Ylr01FtyG7qzWq+Y+sSRMVnN08EFZVol2zsCXggPd
 YZVeD8dFTD6/TrWAT4RoZq5olGbKHO5HDFeKTZvbwmA3gmxOsLTeVH22QJrAKtw0Kd1ZuJYsyJH
 ApvUwfHmM8i9u/N76VKgxSb+DhSZFWBT/HCMU3AXdWaA1Qaijy7nMPeAy6tZiRa/wY0qLoEO3wP
 CKKOIbEBkRWcxEpcwDj6WIlxVFGuib1TR+Xw7vUhU86laZEV6KLleVaJXrO/Bg6qpBsMcy68XX/
 /rNoeQgE7CRrn+11wwA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 clxscore=1011 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=10 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150060

On 10/14/26 11:36 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] mtd: nandsim: IO reclaim self-deadlock due to memalloc_nofs_save()
> --
> 
> commit 6c4530163aa059b5f98e17ba82a9c2b06c3f48bb
> Author: Tal Zussman <tz2294@columbia.edu>
> 
> mtd: rawnand: nandsim: use a NOFS scope for cache file I/O
> 
> This commit replaces memalloc_noreclaim_save() with memalloc_nofs_save() to
> prevent allocations during nandsim cache file operations from recursing into
> filesystem reclaim.
> 
>> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
>> index fe968037f75a2..4559df2cfa3cc 100644
>> --- a/drivers/mtd/nand/raw/nandsim.c
>> +++ b/drivers/mtd/nand/raw/nandsim.c
> [ ... ]
>> @@ -1342,14 +1342,14 @@ static ssize_t ns_read_file(struct nandsim *ns, struct file *file, void *buf,
>>  {
>>  	ssize_t tx;
>>  	int err;
>> -	unsigned int noreclaim_flag;
>> +	unsigned int nofs_flag;
>>  
>>  	err = ns_get_pages(ns, file, count, pos);
>>  	if (err)
>>  		return err;
>> -	noreclaim_flag = memalloc_noreclaim_save();
>> +	nofs_flag = memalloc_nofs_save();
>>  	tx = kernel_read(file, buf, count, &pos);
>> -	memalloc_noreclaim_restore(noreclaim_flag);
> 
> [Severity: High]
> Can this cause an IO reclaim self-deadlock?
> 
> Nandsim executes MTD operations while holding the NAND subsystem device
> lock (chip->lock). While memalloc_nofs_save() strips the filesystem reclaim
> flags, it leaves direct IO reclaim enabled.
> 
> If memory allocations within kernel_read() trigger direct reclaim, the
> shrinker might attempt to write out dirty pages belonging to this same
> device (for example, if used as a swap device or via mtdblock).
> 
> Writing out these pages would route through the block layer back to the MTD
> layer, which will attempt to acquire chip->lock again, resulting in a
> self-deadlock.
> 
> Should this use memalloc_noio_save() instead to safely prevent reclaim
> from issuing any block IO while the MTD lock is held?
> 
>>  	ns_put_pages(ns);
>>  	return tx;
>>  }
>> @@ -1359,14 +1359,14 @@ static ssize_t ns_write_file(struct nandsim *ns, struct file *file, void *buf,
>>  {
>>  	ssize_t tx;
>>  	int err;
>> -	unsigned int noreclaim_flag;
>> +	unsigned int nofs_flag;
>>  
>>  	err = ns_get_pages(ns, file, count, pos);
>>  	if (err)
>>  		return err;
>> -	noreclaim_flag = memalloc_noreclaim_save();
>> +	nofs_flag = memalloc_nofs_save();
>>  	tx = kernel_write(file, buf, count, &pos);
>> -	memalloc_noreclaim_restore(noreclaim_flag);
> 
> [Severity: High]
> Does kernel_write() face the same IO reclaim self-deadlock risk here?
> 
> Allocations within kernel_write() could also trigger direct IO reclaim
> while the chip lock is held. Using memalloc_noio_save() would protect this
> path as well.
> 
>>  	ns_put_pages(ns);
>>  	return tx;
>>  }
> 
Both of these seem mostly accurate. I'll switch it over for v2.
