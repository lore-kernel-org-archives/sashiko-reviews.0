Received: from out16-54.antispamcloud.com (out16-54.antispamcloud.com [185.201.18.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B894766A8
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.201.18.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045079; cv=none; b=roAjSsa/tbI+3QnSTlRf+h1UaIp5I17g4EZ82+0sgpWtUNAKjTBfQvduocdnq+jtmqHxVpkTjmdxZQ3i8dlWGpJBEs1d4d2UjiSzkpaNLE1CBx+TiqAzrW/LzoxIqPHD4BteB5jKybUIAg3H29GZ34P0MTLnEem8RdRG93Mg4bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045079; c=relaxed/simple;
	bh=Co2pFJ8m1lNnf5dvc8PPznnDcez9AJ7PSr4dpP8ZAXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=K5EOSzEX4UCt5IxJEBU+GWgnMGXKTZQ3pKOJw36fU0QFApOpCdpWwdrWrtu5L0QBPpVHezMeRSb5QhoEyHtdFHHic78vlr4oB9d/JxPiN4X7DU+IKFwKeKHmnInjLvyiAoIoAH6pCI/Qc6hd2uqwBYxNZzjyOmwKP0z3XeGNBvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=reactivated.net; dkim=pass (2048-bit key) header.d=reactivated.net header.i=@reactivated.net header.b=YXENqctc; arc=none smtp.client-ip=185.201.18.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=reactivated.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reactivated.net header.i=@reactivated.net header.b="YXENqctc"
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx321.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1x4eLY-005wFD-VS
	for sashiko-reviews@lists.linux.dev; Thu, 10 Sep 2026 14:57:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=56lNZfifOtJI5u87dw3jF6HY3etb36gLy6H3sTn74zk=; b=YXENqctcLSglwMmsIadD+3Fwxp
	E87MeNBzNMUT4V67qegUSmm31tAUCQcYv2GE8tS9CcSm9IXSXmkGzuSM3cfWqprvW+/jcE468ysxL
	lNQeoCgMKjyq6hJVgleO7T/+DMWZ7I0utUtUSxhIYIkr1ybkU7Q8VagnmiQCvi4t98Q7xzPl4BZ4v
	znBA507YnnzHOLDomeKhQVDZe2cJqD1EQFPacFu5GM+CCpub3Sc1iwnvedpPepjb97A2b6aFAeDSE
	wej5J01pp0IKIs9dhyry/RR17PtqzNLngPQYmUAzzqqjl03yn6IGQ5yBlYbu+75Zlhiw7YZxTF33Z
	huLXs0Mw==;
Received: from [188.251.249.2] (port=55326 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <dan@reactivated.net>)
	id 1x4eLa-0000000GIhv-1U6I
	for sashiko-reviews@lists.linux.dev;
	Thu, 10 Sep 2026 12:57:43 +0000
Message-ID: <2300515d-78df-4575-8a3a-54599bc891c1@reactivated.net>
Date: Thu, 10 Sep 2026 13:57:41 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: sashiko-reviews@lists.linux.dev
References: <20260909-bcm2712-iommu-submit-v5-0-2539c52b249e@reactivated.net>
 <20260909-bcm2712-iommu-submit-v5-4-2539c52b249e@reactivated.net>
 <20260909213936.B2A451F000FF@smtp.kernel.org>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260909213936.B2A451F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.07)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuW6z3P8N9BQFKhSRHPmQFJJ8stUCgE1UMnw
 Pyfvc6WM/yu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIMWK8ViGU8Nq0FD7vIeib4cGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWBp35AJbRNknLgMOj3O/cqXeB7itP8hgjDRserKv4bhb7ubyJcscJCC/8jhyq4eIIJWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAuyiWgke4vlU/UJGLBguufR7lnoHQcR
 eJIvYWqeXkPxBWr/eRFKwBSfuIMWwqEQXpWwz5OPtxDVeqPJhEmoz3N9JomUzvBM22AC4k/oTG1g
 jLARRpHhlGd76cI3fB2QEz3dpXCm3V3dWjyhCX8mbAT/24m9iTCwGhFbCqjVyo5bg7pXMX44D2sc
 lZz9QH7f/hmsZUuvgdrOZrw79MAW965faIfVaCHpEB6cFH6WJxE4ZlMpb6W12g3GZpJRdpQ/DtrB
 BWBSQBghGigon0RHJoVZoJm9Ernpyx9sLW7CXtZKFwvGpMflipu3Bk6qao1eLVDj5X6GsI/bDWTs
 V3eVBjhwkvmjeXbB6W1F+p4U3gGntosEMysPur9wmiDBurOy6iTyL6UT+hUW4mK3MFN7nHYMikKY
 GfM1Wxpi+aM7bRAnIILUAj1reKtuJ/PKbNBhf48ZqRZsvzFdn5ebLjeMHi82//vMJyWNpMX2qxGd
 p/6VWFx45afvelx++juvdD5/lDsVVH74myu747LjvVgt4ikt9R/2gMGq0KWAzmMf+ibVDvXBoE27
 LT5eRxAkVALkwYDwY1278R9pzC31fkjBqL4nTj9+FRkaOS/DNjANmb8tO61SbYdYAwdpaVzHW7wH
 O7YhEWyJzIkwSFAW0Pw8uiKeubcolFl/rX+2ReQklqJDAWNDiNfvuBXXgYKXI4vmnOrwY1278R9p
 zC31fkjBqL4n3DVcIoCdt7LsSikJereEVg==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com

Thanks Sashiko for finding some real problems during the review process.

At this point, all of the unaddressed points from previous reviews, and 
all of the points in this most recent review, are false positives.


On 09/09/2026 22:39, sashiko-bot@kernel.org wrote:
>> +
>> +		/* Configure translation aperture */
>> +		bcm2712_iommu_writel(mmu, MMMU_ADDR_CAP_OFFSET,
>> +				     MMMU_ADDR_CAP_ENABLE |
>> +					     (domain->geometry.aperture_end >>
>> +					      ADDR_CAP_SHIFT));
> 
> [Severity: High]
> Is domain->geometry.aperture_end left uninitialized here?
> 
> In bcm2712_iommu_domain_alloc(), domain is allocated with kzalloc_obj(), which
> zeroes the structure, but geometry.aperture_end is never explicitly initialized.
> 
> Would this configure a 0-sized translation aperture when writing to the
> hardware register?


It is not uninitialized; geometry is handled by generic_pt during domain 
allocation.

> [Severity: High]
> Can this violate IOMMU isolation and corrupt DMA?
> 
> The hardware seems to share a single translation table across all connected
> devices, as noted in the commit message. However, the driver configures
> .device_group = generic_single_device_group, allowing the IOMMU framework to
> assign a unique group and potentially a different domain to each device.


Sashiko is confusing generic_device_group with generic_single_device_group.


> [Severity: High]
> Does this leave a dangling pointer if the cache device is unbound?
> 
> The reference to cache_pdev is automatically put when leaving this function
> due to __free(platform_device_put), and no device link is established.


Like most iommu drivers, the iommu driver (and the cache driver) can't 
be unbound (suppress_bind_attrs).
