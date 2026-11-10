Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303932;
	b=20To67JxO9WZpDaOZOhxqUCZ6LuLRP3U1s+OZeg6msKxrB/4XQ3A9AL9HitFgWo0vScV
	 cyg2QNg/u8BJjF4OYGTIWdrcliZvj0nvI6lolz6Lh65Rj/h+jpYiuMY0scsmAgM58EfwM
	 SKCXLHouOPiZwLaL1LsnOetDNukQcWYsMUV7ZvpTDJreAKoNqWGQg5FTArSin+iuXCu5E
	 dasAqhg1YHTC9Dy8wpuUXJlfTjAzR+78TRjRNAvbOb/YiLG9pFd5/MglWDWzIjbrLROY7
	 bXfbThW8IVbcMRgwGyQhvJmeOHhRDTVafhvSvklCuoLAjJMz5voC8HrLEZ7wRu1/LSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303932;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=Yt1RUkpWxEjGNFb0fWteE6fFY2lB9nSa+4LX3gy4fTM=;
	b=oHB0/mEERckXEaxSlmYXwLm4y2Py3SeZG0b7oMXFl9MbcLpBcKRylJAuj2foJ/W31CcL
	 8/WZvyyIMKF5v5Qj1HXH7IDc0RSNu99LDQYHOgUXBR9WDmD+Qy1bJBy3w63MGEmMiMpfY
	 tHtWauwQx9mKB+sO+yAcEb4FRUPHKaDBEiF9S9uAalcjBNYeClFJGY3PxdPnxA2Tj2kLX
	 DR48WDdTgDNOa2LRlDI1rhD0vWuya/66zvwfJ3lnyn5xHibL91G1LmK8nH2qKOoZICbuF
	 n3MVrZEEnRT8+Y9HX0SUdVFI/6mHF0KQR1ACKux5Y0rGj+vH57unEyWyUD1rzJ/6jnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J4PgORa7;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32860606B9D9
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 09:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32860606B9D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J4PgORa7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794303931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yt1RUkpWxEjGNFb0fWteE6fFY2lB9nSa+4LX3gy4fTM=;
	b=J4PgORa7zIwG2eBxWoxXTPBQ6JPpGRi4FuttCZ/YcqX3H9bW6cwO8ieqNxwuuaSbS1Qv08
	kQhqRwM5FJfIjR3gx25o4jRYBii9Cl5+EA26h8r1YnH9L7HoU2GhyH4nLADHhhVW6zwYZL
	IkfD8lMW6Xi8rKKRwxm+K0bRO2XitEQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-31-8ytUxQaUOf-lyaIqo9r1PQ-1; Tue,
 10 Nov 2026 04:45:27 -0500
X-MC-Unique: 8ytUxQaUOf-lyaIqo9r1PQ-1
X-Mimecast-MFC-AGG-ID: 8ytUxQaUOf-lyaIqo9r1PQ_1794303926
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73CFA1800347;
	Tue, 10 Nov 2026 09:45:26 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7189E1956086;
	Tue, 10 Nov 2026 09:45:25 +0000 (UTC)
Message-ID: <da73c81a-7fd9-47c5-bd09-3652c83d44cf@redhat.com>
Date: Tue, 10 Nov 2026 10:45:25 +0100
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
Subject: Re: [PATCH net-next 06/10] dpll: add KUnit tests for core locking
To: sashiko-reviews@lists.linux.dev
Cc: intel-wired-lan@lists.osuosl.org,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20261106121005.1327603-1-ivecera@redhat.com>
 <20261106121005.1327603-7-ivecera@redhat.com>
 <sashiko-outbox-202878@kernel.org>
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <sashiko-outbox-202878@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: C7ZFrNcjV6IUB7zwjeca8rzYBI4hYZuUtSl6ZhYaWL8_1794303926
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 13:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dpll: dt_fwnode_pin_add() duplicates
>    kunit_fwnode_create_software_node()
> --
> 
> commit cb6cfd6901bcce17d3e841bfa531bd7cce8efeac
> Author: Ivan Vecera <ivecera@redhat.com>
> 
> dpll: add KUnit tests for core locking
> 
> This commit adds KUnit tests using a mock driver to verify domain locking,
> callback serialization, cross-domain pin registrations, and notification
> ordering in the DPLL core.
> 
>> diff --git a/drivers/dpll/dpll_core_kunit.c b/drivers/dpll/dpll_core_kunit.c
>> new file mode 100644
>> index 0000000000000..a58800eda5ff5
>> --- /dev/null
>> +++ b/drivers/dpll/dpll_core_kunit.c
> [ ... ]
>> +static void dt_fwnode_release(void *data)
>> +{
>> +	fwnode_remove_software_node(data);
>> +}
>> +
>> +/* Creates a pin with a fwnode so that it can be registered with another dpll */
>> +static void dt_fwnode_pin_add(struct kunit *test, struct dt_pin *pin,
>> +			      u64 clock_id, u32 idx)
>> +{
>> +	struct fwnode_handle *fwnode;
>> +
>> +	fwnode = fwnode_create_software_node(NULL, NULL);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
>> +	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test, dt_fwnode_release,
>> +							fwnode), 0);
>> +	dt_pin_add(test, pin, clock_id, idx, &dt_prop);
>> +	dpll_pin_fwnode_set(pin->pin, fwnode);
>> +}
> 
> [Severity: Low]
> This isn't a bug, but could dt_fwnode_pin_add() use
> kunit_fwnode_create_software_node(test, NULL, NULL) from
> include/kunit/fwnode.h instead of open-coding fwnode_create_software_node()
> and the dt_fwnode_release() cleanup action?

Will use it in v2.

Thanks,
Ivan

