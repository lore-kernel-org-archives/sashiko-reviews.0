Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500D18D636
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029165; cv=none; b=IZBAx3pY8IgNlrOBDNPi/T3e6pDNTei4CSZkP3VW5rmmdj9HUm/6QVj9dUxrFBUCYBs8Ym0hDX4uhKh0IklPmL8BXqy0sGWmZaEbMa6wZKVmKuSKRx9BSfO8xw36Ijii6JsbPnoh1vFXBbOMj0YOZDf8MhDSiktDvrnDKiKjB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029165; c=relaxed/simple;
	bh=JDGlkO80/4eCZ+xaiLytlvS5xjqXuTVj0rvJyW8fk18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qA/UrnKm6JPj33pReMVHEf5OFrWJI64vSaSAF98zqr+XSok2TSH5Gq6Y07XqWemHMyVg6Qb19xEt1z2+pI2onW3iTqhHIqfBIzfzYugC2VskX/vP+VMK75kS5IwvimMOeWvk59vjQKjAYZ47yYwQfjZ6S+r2de66lO2kPDHDLpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=hI8aZdw8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="hI8aZdw8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so3194833f8f.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 04:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784029159; x=1784633959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVAZD/QZRiDNfNtUy5ZL8amdKrMPkHTvglBUm1ucEk0=;
        b=hI8aZdw848aTCcArO9XOn6rzWEWRvFMp6yiIULHFv8VL70d+2ZEPARiWAPtN276BfA
         fP6qayH+1X7D3tvZ5Tu83aw+a/yGXyXXvdspi8Lf0meuzp6pFP6r2Vn4gNGmAhHjWrbC
         RcQJV1FaldpawaujW75s/uG+cFUmqMZrcL5HyWRVHue32iS7UNix3M3jitk/kKMUNaxv
         BMJ0fz28dSRQel7/25eIm7lA35jmeNrYtsfRRUW/QvBRoA2d1D6gAdySVuorFsrTDjPL
         eOL41LsWm3kZrOMChFpdgglhvv6Cb7RZs4H4JgnfiXV0jI8DzdoQ3F+1lFZfJtepF0Of
         Wpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784029159; x=1784633959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVAZD/QZRiDNfNtUy5ZL8amdKrMPkHTvglBUm1ucEk0=;
        b=DKGyi1HxL7OrKLVdEk2wKvcCkcjt9gAEdncLE3BqUz67lktEKsXuvFKzxmdEsf1OTd
         VRjtLs2W+4V6IJTyf2A2lUgSWOYBOWeQV2IwbT/wjcaq7E4erFsyOfj9kKCUbYBfhuhA
         ISad0J6ha2c1YWmo37L/QIoEA+cvGGrfaM9J3q0mqFd58RTDf7pnIMpSpzKcZeAEBlb+
         6HZ7eVJiJf+1CguohRwox6x0phPnsYNHJCROFyEQQF0hJi/wcyRr4fRTBVgqu+Wh71zz
         ZOVxeYmBx3EqgH5gdus1LEtGuVwlBD369YXaZLD7BUsxZn3t+WxY+Oh3MvESs6ABfeMR
         SPqw==
X-Gm-Message-State: AOJu0YzbAARF3xbYh8reBNlYjn8cozr70qVP0i7CS5G3ST/80/FHvzN0
	gAyZmagkLQ8jZF+aWyezaM6Qua4Gj7rXOqeVIo6LmnQZmAj4Wf7kGwmWahnUaO6KnBqocz0h1UY
	LLR1Q
X-Gm-Gg: AfdE7cnn8c5FbakIsgRIPQLUwKhXNlZX1ISRgESX+shPh8Mu6JvmUWoWjk3EYENFA08
	10p83Y1rDw8Pwzcol1nC2sOXim4gmh2HYqMTN/bn4ctkq7IN1sy7CHRP7lAiVxSwFa28/finTN6
	nZPg/CH2iOy7iksJIq0FvVOtq0mdoF6jpd6kRYMU0t7jCV6vVQfAHur0xmraKDu+ODVW2+b4keT
	3quuqpa8/H4ad9Qv5aDn4dunw/gQmi0az+N7x+UDGfjXN6SQsToEHFz3PXLvl1Jx53mi8QWzYzv
	Pkil9GvFcnuylco6U6FyZaVoI2jXmY4oKtMXo8bXd66sdQVpfJPHzN73lpOcH4nWgn7MFVyKzk0
	+7VBOb8QC1KzCleNVwayEp876p9bPewyVqWyOM2AusWN7aH7VPRev30IxKhFaM712+S4RvhROwR
	aV6kvGuDW0FY6AJX/bKrsRpg==
X-Received: by 2002:a5d:59c9:0:b0:472:edc7:b4c9 with SMTP id ffacd0b85a97d-47f2dce91aemr14601962f8f.38.1784029159490;
        Tue, 14 Jul 2026 04:39:19 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm5897940f8f.21.2026.07.14.04.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:39:18 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:39:15 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, Heiko Carstens <hca@linux.ibm.com>, 
	hannes@cmpxchg.org, linux-s390@vger.kernel.org, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH rdma-next 08/13] RDMA/cgroup: Scope rdma cgroup device
 visibility to the net namespace
Message-ID: <alYfV5DlIDBw5J3_@FV6GYCPJ69>
References: <20260709095532.855647-1-jiri@resnulli.us>
 <20260709095532.855647-9-jiri@resnulli.us>
 <20260710095629.BF89E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710095629.BF89E1F00A3A@smtp.kernel.org>

Fri, Jul 10, 2026 at 11:56:29AM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>- [High] Scoping RDMA cgroup device visibility to the reader's network namespace breaks host-level cgroup administration and monitoring.
>- [Medium] Concurrent lockless read of `device->net` using `read_pnet()` without `READ_ONCE()` leads to a data race.
>--
>
>--- Patch [8]: [PATCH rdma-next 08/13] RDMA/cgroup: Scope rdma cgroup device visibility to the net namespace ---
>commit 18e4bddcfb08bd42bef710d6d1b72824d15fa2c9
>Author: Jiri Pirko <jiri@resnulli.us>
>
>RDMA/cgroup: Scope rdma cgroup device visibility to the net namespace
>
>Track each rdma cgroup device's net namespace and sharing mode, then filter
>name lookups and cgroupfs enumeration to devices visible from the caller's
>namespace. Keep the cached sharing mode synchronized across registration,
>netns moves, and runtime mode changes.
>
>> diff --git a/kernel/cgroup/rdma.c b/kernel/cgroup/rdma.c
>> index 5e82a03b3270a..c8b4e3de76305 100644
>> --- a/kernel/cgroup/rdma.c
>> +++ b/kernel/cgroup/rdma.c
>[ ... ]
>> @@ -464,6 +465,13 @@ void rdmacg_unregister_device(struct rdmacg_device *device)
>>  }
>>  EXPORT_SYMBOL(rdmacg_unregister_device);
>>  
>> +/* netns_shared is toggled without rdmacg_mutex, hence READ_ONCE(). */
>> +static bool rdmacg_device_visible(const struct rdmacg_device *device)
>> +{
>> +	return READ_ONCE(device->netns_shared) ||
>> +	       net_eq(read_pnet(&device->net), current->nsproxy->net_ns);
>
>[Severity: Medium]
>Does this lockless read of device->net using read_pnet() cause a data race?
>
>When another thread concurrently moves the RDMA device to a new network
>namespace, it updates device->net:
>
>drivers/infiniband/core/cgroup.c:ib_device_rdmacg_change_netns() {
>	write_pnet(&device->cg_device.net, net);
>}
>
>While write_pnet() uses rcu_assign_pointer() to update the pointer concurrently,
>read_pnet() here expands to a plain pointer access without READ_ONCE(). Since
>rdmacg_mutex is not held during the write, could this plain read race with the
>assignment and cause undefined behavior?
>
>[Severity: High]
>Does tying RDMA cgroup device visibility to the reader's network namespace
>break host-level cgroup administration and monitoring?
>
>If a device is moved to a non-init network namespace (exclusive mode), host
>administrators and orchestration tools (like systemd or Kubernetes running in
>init_net) will completely lose visibility and control over its RDMA cgroup
>resources. Attempting to write to rdma.max will result in -ENODEV, and reading
>rdma.current will show an empty list for these devices.
>
>Since cgroup state must reflect the cgroup's configuration independent of the
>reading process's network namespace, does tying the UAPI to
>current->nsproxy->net_ns violate VFS semantics where an open file descriptor's
>behavior would dynamically change depending on which process calls write()?

This report made me think a bit more about the current approach.
A cgroup may contain processes using devices from multiple network
namespaces, so caller-relative filtering can hide part of its state
from host administrators and make the same open file behave differently
depending on the calling task. That does not look and feel correct.

Instead, to handle device names that are duplicated across network
namespaces, v2 will use the system-wide RDMA device index for
disambiguation. The existing name-only format will remain unchanged
for unique names. For duplicate names, reads will include an `index=N`
selector and writes will require it; ambiguous name-only writes will
fail with `-ENOTUNIQ`.
