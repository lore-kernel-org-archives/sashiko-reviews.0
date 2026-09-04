Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7647D4A3859
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529861; cv=none; b=gU9Cf76zYNnaJN8lk+Qvmdov2ictWa5VNLPIuB8/BPsoK6GABAFRIac+foWmRcWN+oW1bDTXiqVYmfvKfUIrHvkM1/IPnqkMqHgqzxrneHVseeWHdL5UhHJ4h0lBlK1K4zpBD4IwKOSkFAo5EBdUe0iNcv8ACR/rPGFFqGijOLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529861; c=relaxed/simple;
	bh=8p9pX3f/Jni4/804dN03aY2QgzvCn8h0nT7REjf25z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7F3/4TxfxdKhf57RU2pEiFCKsH15lRw/aGmLaUDHHB9jMelfR63vvO23YYiO7dTn/AQgIobd1ttKOOa3vlkHV5nzmT6gReLa9fRgALZHoaO6Kmbz0awHCHIFRx0o5k4BMWw1C0P3cGNtv2E0wcI5Gw0xn2x0KUfcwj5cdGRxrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i23B4pSA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i23B4pSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788529858;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMGOFQALV7U5ZmaS0qjL9QRN5TZgiLFu8RShunh6mL4=;
	b=i23B4pSANkT6Pd1oMD5GHPCMDc8qCDhbcXmqm5kkkQiKBqbdRRrWC2CGIr/dsj2YxeoAhQ
	7w/Zqe6AUVpckTG6ukYLrYDvRVxR5Eg0efboDk+HwPfBShA2KfAK1kmvKXNMDohs+e4adS
	dWj6lVZqN8yG51NyxN1f1q+5OptJs/s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-HJvLzFk2OLadWgTQb3OIVg-1; Fri, 04 Sep 2026 09:50:57 -0400
X-MC-Unique: HJvLzFk2OLadWgTQb3OIVg-1
X-Mimecast-MFC-AGG-ID: HJvLzFk2OLadWgTQb3OIVg_1788529856
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49953abe51fso7608615e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 06:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529856; x=1789134656;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMGOFQALV7U5ZmaS0qjL9QRN5TZgiLFu8RShunh6mL4=;
        b=kQgExXd0+B0T4kxQ+egEBedgMNFwRa3t+rOwPJuMxhOA+3H9PLAtK0HCAewRq9GHCE
         WxMn+bi+AbXgRDDMd/AFfiCsksL+itclhKI9xSgWo6whxHxc37L/uES5yKpKxscJnB/z
         38OqXF5xGyFpGqRRoy5SvogTmNzDX2zpWADJo59Gy7MqwrxR7E25ujDX7L/3YFnjJTyC
         vbQ6h9lrkRUJg87mXKf8Xjs2xKxFdf/C0WSk9PasCn3Db8Py3QLT1nHZAV+/CGQQCt1F
         mEZpdQpmgaIqMS7tJLyPFA0EeufJAZ9ApabwlB4vgwhjIGjm4pky/dAJFFiAgfMdvz4d
         isDg==
X-Gm-Message-State: AFuF++n4GoEs88jix00riV1YJXwW9h76H79YEElMW0tFyrD8IVTXKwuY
	ZNDIUOqmdbJ+wldudiPv9+jU9DyT9pZQ3d2GanYv8w+aQEIa82BUHYPqV8scyNR6brC4FWJN0Qf
	nQdB7uO0Utp+jX6994oL+m3s6QsgsN4ujWlqGZGG9J2bIq4Dzg4/PejAIh8mK8HtHiFrfIPVM/c
	MPpyAShUqiHINtHYK+OMObkxsyb9CW6SBRGTTBOBVPKKY80aSCbPe4D0dc
X-Gm-Gg: AYBFou2Mzznf8HjOFLf5O4tuZTnHqatrPkMz1SBXcavjb4V43iHVyXwcmmP1a5gbjId
	paQ/o1RyP5djgYpEArZ0XdHcYf3PtXTwvNXkrsBIFRT43HB8yU75JPLVJqPcTitXq1jUbsSIT1R
	9A4VugMGQr2HKmy0+tUljqBN9G6dknP7QJdrGAWgV303FYXRjiPW/WoUrKR+sb8FCISncS8ItyD
	ltCj/Irvc3RE/dTD4yKfMPi68FtAiZIwmr0xbf6GzAsV3dgNgXf7pQV0Uuj922am6NU2g3u0x8R
	SHG1KbDTI6ODNlXCqtGpnsIUQd35ko7HUZUPR9VSRhXfQikTueXm2ItjEisrsPGW2JmSnqaE4Z7
	ptChHMJLkfKqQerLo5mrlwPqHtkccLtMAdQ==
X-Received: by 2002:a05:600c:c1d7:20b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49cffe32f58mr2114165e9.3.1788529855762;
        Fri, 04 Sep 2026 06:50:55 -0700 (PDT)
X-Received: by 2002:a05:600c:c1d7:20b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49cffe32f58mr2113475e9.3.1788529855165;
        Fri, 04 Sep 2026 06:50:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm172660985e9.1.2026.09.04.06.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:50:52 -0700 (PDT)
Message-ID: <75c62e73-0c71-4143-84ff-a1707ff822ab@redhat.com>
Date: Fri, 4 Sep 2026 15:50:51 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3] vfio/platform: prevent read-only region mappings from
 becoming writable
To: sashiko-reviews@lists.linux.dev, Abdifatah Suruur <suruurism@gmail.com>
Cc: kvm@vger.kernel.org
References: <20260903092907.419-1-suruurism@gmail.com>
 <20260903094814.EC02F1F000E9@smtp.kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260903094814.EC02F1F000E9@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JHj-bZxlSQEKXvw0n9yskYcJkbEpjbanThpXgzZqTWA_1788529856
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/3/26 11:48 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [Medium] Modifying VMA flags post-merge inside the .mmap() callback silently breaks future VMA merges, leading to fragmentation.
>
> Pre-existing issues:
> - [High] Incomplete mprotect() hardening allows unauthorized read access to write-only hardware regions.
> - [High] Assigning a raw physical frame number (PFN) to `vma->vm_pgoff` for a file-backed VMA corrupts the VMA interval tree.
> --
>
> commit 6c3ce3b68057fa0dfd3b9b92fc8493eaac414153
> Author: Abdifatah Suruur <suruurism@gmail.com>
> Subject: vfio/platform: prevent read-only region mappings from becoming writable
>
> vfio_platform_mmap() rejects writable mappings of regions without the
> WRITE flag, but leaves VM_MAYWRITE set. Userspace can map such a region
> read-only and then upgrade the mapping to writable with mprotect(). This
> commit clears VM_MAYWRITE for regions without the WRITE flag.
>
>> diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
>> index c72db5a99ebda..20d87c244ca28 100644
>> --- a/drivers/vfio/platform/vfio_platform_common.c
>> +++ b/drivers/vfio/platform/vfio_platform_common.c
>> @@ -595,6 +595,10 @@ int vfio_platform_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
>>  			&& (vma->vm_flags & VM_WRITE))
>>  		return -EINVAL;
>>  
>> +	/* Prevent read-only region mappings from being upgraded with mprotect() */
>> +	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE))
>> +		vm_flags_clear(vma, VM_MAYWRITE);
> [Severity: High]
> This isn't a bug introduced by this patch, but while this hardens the WRITE
> path against mprotect upgrades, does it overlook hardening the READ path via
> vm_flags_clear(vma, VM_MAYREAD)?
every MMIO region in vfio-platform is marked as
VFIO_REGION_INFO_FLAG_READ so write-only regions do not exist. I don't
think there is such symetrical need here.
>
> If a user maps a write-only region with PROT_NONE (or PROT_WRITE), they
> bypass the initial vma->vm_flags & VM_READ check. Since the region lacks
> the READ flag, the user should not be able to read it. However, because
> VM_MAYREAD is not cleared, couldn't the user successfully call
> mprotect(..., PROT_READ) to upgrade the VMA and read the memory?
>
> Can this allow an attacker to gain unauthorized read access to write-only
> hardware registers, which might corrupt hardware state machines, cause CPU
> stalls, or trigger fatal bus errors (e.g., SError on ARM)?
>
> [Severity: Medium]
> Will modifying VMA flags post-merge inside the driver's mmap callback
> silently break future VMA merges and lead to fragmentation?
>
> When userspace mmaps a subsequent adjacent segment of the same region,
> mmap_region() attempts to merge it using the proposed VMA flags, which
> still contain VM_MAYWRITE by default. Because the existing adjacent VMA
> had VM_MAYWRITE cleared by the driver's .mmap callback during its
> creation, and VM_MAYWRITE is not in VMA_IGNORE_MERGE_FLAGS, the flags
> will mismatch.
>
> Won't is_mergeable_vma() reject the merge, causing VMA fragmentation for
> adjacent mappings of the same read-only region?
Isn't it pretty unlikely that the region gets mmapped in several
adjacent chunks? At least for devices officially/publicly integrated, I
don't think this happened.
>
>>  
>>  	vma->vm_private_data = vdev;
>>  
>>  	if (vdev->regions[index].type & VFIO_PLATFORM_REGION_TYPE_MMIO)
>>  		return vfio_platform_mmap_mmio(vdev->regions[index], vma);
> [Severity: High]
> This is a pre-existing issue, but does assigning a raw physical frame
> number (PFN) to vma->vm_pgoff for a file-backed VMA corrupt the VMA
> interval tree?
>
> vfio_platform_mmap_mmio() explicitly overwrites vma->vm_pgoff with the PFN
> before calling remap_pfn_range():
>
> drivers/vfio/platform/vfio_platform_common.c:vfio_platform_mmap_mmio() {
> 	...
> 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> 	vma->vm_pgoff = (region.addr >> PAGE_SHIFT) + pgoff;
>
> 	return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
> 			       req_len, vma->vm_page_prot);
> }
>
> The VMA is inserted into the file's mapping->i_mmap interval tree using
> the raw PFN as the index instead of the file offset. Won't any core kernel
> mechanism (such as unmap_mapping_range) that searches the interval tree by
> file offset fail to find the VMA?
>
> While remap_pfn_range() expects the PFN as an argument, it does not
> require overwriting vma->vm_pgoff for non-COW shared mappings.
the same pattern also exists in cdx/main.c, fsl-mc/vfio_fsl_mc.c

Thanks

Eric
>

