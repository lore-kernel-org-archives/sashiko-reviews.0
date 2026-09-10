Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52F645D93B
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037423; cv=none; b=FriSV+7A1npBFgm1Saqq12CpQ0tkXZQ8oaJpZfwHDQyVB36xl5qB2lnntyV3z21A5FcGfnQlpYsjrevYFt/KzXc+FE+fDyQni2vYoBk8FhSl/PKnNWIZljD4AJtJK03xcLZF5yJxQlYotQb4XxWcmQZ7hzalGFRrt50BA74VzpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037423; c=relaxed/simple;
	bh=lrIXAC8cYNoVygFDFSiOCaWQyot7ZJ6zRghfRlFdzz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RY6lwhmy5MwLSY382lxUVv+l/9bPW/Ri5KDqAVBcSmypzOz6n3UbtEc6uC2eK4J57txlVs6zbj1soi+70xuXf6CFIzDwTW7PSBluOYgYq5gFmqJxigNDp5cqVt0kxkL1WYT9+Zj/eZXGMs7LrZuC6vw0G1oLbn4Ka2w2bGOKMDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M1op3KQG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M1op3KQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789037416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7hkRUQ+GXdK6lyDfi0TTOprM8ecwt5B1P/G3pNJiII=;
	b=M1op3KQGIHnFPwEnfmTPufz2CsIPBsduM8iC4gjg0BtqqCEdEhLHOyUCu7L2wFqkPuR6do
	ZiechxfHSfuvKJy3+1ANsYcbRzc9L2zBx8VXYICTOFOdKd14LG0ZIdd7j3Npy8X1rln7vq
	pluPA0tydFpU+lzJkK1VRMzMUmPz6hk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-EribMZj2OUqkj5cG7_nSDA-1; Thu, 10 Sep 2026 06:50:13 -0400
X-MC-Unique: EribMZj2OUqkj5cG7_nSDA-1
X-Mimecast-MFC-AGG-ID: EribMZj2OUqkj5cG7_nSDA_1789037412
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49d28ac5735so6472985e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 03:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037412; x=1789642212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7hkRUQ+GXdK6lyDfi0TTOprM8ecwt5B1P/G3pNJiII=;
        b=VoIWmmwsYQ83dAIqeI1Z2om3HlVZZpJQK9DruRJXcms3l7/ukHE0D0wtPQRSyyd5NE
         jo7feXueGtQjMhduHyLT95NbBwxy45UsLaC/9z0mSFhOyhGBFD4SgkUO/S4k8DQcGu2Q
         BWwEv3FrahmvIfYvm8Z45BCFkfPQyJW9MW4e4Clp4mUBkyyiPTK2mOpg5X7me3wVggQ3
         tL/2o5oucRJRvxCB2IOFS6jf7YOIdqekmRyOxbylmPjkx41tElMVxMCwvQekxtTyttGx
         WdXdQN5dL7WWpEb08QbiWQb2Zhjmxf9XGanlMrTB8KhAccE8l1cOkyZ60AtJa6fuDvzG
         s+aA==
X-Forwarded-Encrypted: i=1; AKwUvByjfWeZrnVSNtmq8sqHv96rs1OxNUTTdSkUjWf1Yi0SINt8j5W8C7uVKhMuw32Lz4S40mVK0dbPRf7uUJhpqMI=@lists.linux.dev
X-Gm-Message-State: AFuF++kzsGve7UbPQ5C4rzpE79X9jwKuZ/3WgG7qJ8owEFUI0i5qt5xG
	0PF+pzXn2GkJ5Xf1mrCYHdUGeci5gAVaLDh7mUniXUi4QJJRuDTVcZtS9QAeeAXcRfpBlbtuD2D
	uNGnqSCx8zttl7Je2IllyQSfXdEzC309YXBiCaV/TaQpMZp6q+S+GS3I1s6PkrMDLB5RHuw==
X-Gm-Gg: AYBFou0247m5recKSbpRxrjRBd4ZuYjp9Iq6tAwf7EVw0LlYI41vbDqIxDlJzkRz7Q6
	5KUJgAhlb4pftX5OH0ichxihVmIefosD2u0mdShD9Ubjf0/ME1MpOI4Zt94r70vb9POcxTteOrk
	fuYITwKwXIg2ZD7vqOcXAOIvBjwAaueALahVDmL9HJa6SVsCqTjQPk9LVQ+2VbtXK8UHY6xhq0h
	AQkwjPXkHif1O00J8xjoW9ub0vqj5EAh/Yrt855PKBJNiINyrp1PFSPDKqahQoOTHapeddCR7jd
	VxDYIylC5nl4XVYPra9LFTGlmv7pnp/pBDpdKWx+QXFPpFvj97ZC+Q1QoBpttSFUFelHn/pNtNf
	OcELBVxd9s7BqXUimaRm7OJxIHvYRCDRxllNs/2GkvYMmMAb3KoZUEkmvJ9udVMT3R8rq3bNVRw
	==
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr490157975e9.12.1789037412219;
        Thu, 10 Sep 2026 03:50:12 -0700 (PDT)
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr490157565e9.12.1789037411810;
        Thu, 10 Sep 2026 03:50:11 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfc1sm81538805e9.4.2026.09.10.03.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:50:11 -0700 (PDT)
Message-ID: <ebded824-c858-4187-948c-b5444f4bf82c@redhat.com>
Date: Thu, 10 Sep 2026 12:50:10 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net/smc: fix abort_work termination in
 smc_conn_free()
To: Hidayath Khan <hidayath@linux.ibm.com>, sashiko-reviews@lists.linux.dev
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20260907114721.1303498-1-hidayath@linux.ibm.com>
 <20260908114743.481841F00A3A@smtp.kernel.org>
 <3991782b-7a63-4bc9-94c2-02b3f9173586@linux.ibm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <3991782b-7a63-4bc9-94c2-02b3f9173586@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AR9bpY5E-lzCn8Gn16HGjW9lS8ZtVOwZs20bTVSd0tk_1789037412
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/9/26 8:48 AM, Hidayath Khan wrote:
> 
> On 08/09/26 5:17 pm, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>
>> Pre-existing issues:
>> - [Critical] Late-queued `tx_work` can execute on a freed socket because it does not hold a socket reference, causing a use-after-free.
>> --
> Thanks for the Sashiko AI review. The finding is correct.
> 
> tx_work is the only one of the three connection work items with no socket
> reference:
> 
>    close_work   sock_hold smc_cdc.c:420   sock_put smc_close.c:444
>    abort_work   sock_hold smc_cdc.c:324   sock_put smc_core.c:1754
>    tx_work        none                                  none
> 
> The link group holds a reference while the connection is registered, which
> is what hides this. smc_conn_free() drops it in smc_lgr_unregister_conn()
> and never cancels tx_work - it only cancels abort_work - and the link
> group usually outlives the socket, so lgr->tx_wq is still there to run an
> item that was queued late.
> 
> Worth noting the fix in this patch does not transfer. conn->freed works
> for abort_work because abort_work holds a reference, so the socket is
> alive and the flag is safe to read. tx_work holds nothing, so by the time
> it runs there may be no conn to test. It needs the missing reference
> rather than a guard: sock_hold() at the three queue sites, sock_put() in
> smc_tx_work(), and the reference returned at the cancel sites that report
> they removed a pending item.
> 
> I will send that separately, since it is a different work item and a
> different fix. This patch is unchanged.
Could you please have a look at clashiko report, too? that looks
correct, too and more strictly tied to the issue addressed here.

Also note that netdev-wise the most relevant sashiko instance is
the nipa/clashiko one, as it includes reports/reviews/findings
from the public clashiko instance.

/P

