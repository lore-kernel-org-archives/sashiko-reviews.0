Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0704A138B
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719071; cv=none; b=UdyTiIspE2z1zrwJ1LyvVD9a9uz81OLaI4/KkpcbG+7DYhs+Kr3iRRsOeIBl4aY2MpYVd4Dzpo536Dy+YOTnTmsLqf3leRrqmVQLwOsd62g8aW4Kcf0lS2W+16VqpELv6xcBDiw7UQVxWVrM0sDjzOho8q0VUvFqjEhBd/13AR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719071; c=relaxed/simple;
	bh=YZCF4nH65+6leZ972g2jHzva47IW7QotuP+bNf6aKt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tF2yJ5AC54IJO2NZSTOk6sxe8gp0xMlK2neXzs+U0CnLA5VuOvPv/NuRw9Q3jx15Q9WmboiNZLiqj38rLtralkJDsGUzk5HVD3GqKOs+ylqVMb8gY1yYhpwDkZ8b30iFqeH4Ey/pLBLBeFQnlwviKmtQH34iraqVkQruT27DWKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=PC7bzMWP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="PC7bzMWP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f7444576cso2419995f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784719067; x=1785323867; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oQzmdQrHHjzl2TIMLkjd9uZ5aaE+riwTncnOTTjJPBY=;
        b=PC7bzMWPtPMs51VoO8YQjvdTQ1WL0WBkFwNVmy1Wjj2pOZOIER83utQnR9bDk2bzFR
         1OV8e+MaJ6RhPVKIPZaK6uK7UOHIX5/mmRb3OdTU03qm+kHZfeapl8beXx27RuctLBfK
         GbHI2XPdjd8of9Cda4V3JMvfHGM765KxiA+p3E51BzZZaI8Qmc48DSg9MUxM5B8UnUY3
         y52shCvstYpjAa/Hbl+fK/HyFhM+gTiJkMDQ2x9j3QoC6R3dMi+GAv/NfXlkoKgmu5/0
         6G87c2hb9dTrODPJiD+aA3JT+gotnoeTo26CEt1dQcPf//Go7XQ+kxN8oMj09dK7INej
         vvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719067; x=1785323867;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQzmdQrHHjzl2TIMLkjd9uZ5aaE+riwTncnOTTjJPBY=;
        b=EQ8GjO1i5duVgVAyLPvgFmaNDeGxCXdOQIlUJyCYrVLfhUVXW8ox0H+8b4F1gkVEfX
         V4UfWyvuM4cIsjT5JBhyUGf5K/9wkviUv5eRB32Mf5/lMaOnw4ulpqzhWY74sValxzep
         /dqwx4ORpoTfgOQgDzKwZLfthESCNZMnSTVNfEo59F7ibH3dpOGRqYhXbyCHoc2THjQ6
         wUfRsW3C9u8t+9qaMtFnYlFBio4txMQSZpKhydFQpuZklZZbdU9zL+ggWJloNYvi6YI9
         +8Ker/mT9QuKMRt1SEbM/nfUZHeiT6Nhz1vnc6OqUBNl7GdeUGq/mfWXHtkNYtUepniY
         bprQ==
X-Gm-Message-State: AOJu0YzrTUozWL9AK5dRRoHs/bgOkU3vL2Gzc+39OkI5oSruiT+iCy84
	tr9kFFrmx7tD5PrPTBhaYv5aFH2uHRVLE1KsilPHtZ7RFcjCa1MgZyGm5+1fvpzCt3Ly1DM3xft
	Vl9/c
X-Gm-Gg: AR+sD11be3ZEjMHKZJPkH0qg2rQVRAfo2ZgkmcA2F0UjgYBGBu9UFQd3YoNxwuNkvaF
	QWfqyuNEV+igG7zEWxfdlBA5IWRp0cdO0YQ6Y7jqNL6rEQvb1h923a3laL04SlktWRlaijRvH/K
	PmX0n23eDu5rhkyjk0YHECe6td4HnQnLt0fAhZbNc9XFK+5vsoqvhAOlbpgrELuctvr8nv/PiQC
	H1emKLD1xq2tQ/sYQCUdHJSLrKZklO16GlDKXz59tRkEk+ggez3wcyZjYwrOwkmrW1zx4TMyVoV
	UqSBOZuc7T6DBf+DxImJHJK8oOxn6DmLOLc8Gx0cKGJltdRG0qG2Cr6a1iatXhkxI34ZAllbBDq
	xqjptuGu0sHOi6mh74yjGh5VALTdzczUl0L88l7rpGfsQ/3W8cclf3/x+OOZXbo2yIE88Vu8UWD
	zUhGuQ65E7l+jlKoRN3a2I9w==
X-Received: by 2002:a05:6000:4a19:b0:475:f100:3607 with SMTP id ffacd0b85a97d-47f623391c8mr25765066f8f.54.1784719067091;
        Wed, 22 Jul 2026 04:17:47 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm5624448f8f.25.2026.07.22.04.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:17:46 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:17:42 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: Vasily Gorbik <gor@linux.ibm.com>, tj@kernel.org, 
	Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, hannes@cmpxchg.org, 
	Heiko Carstens <hca@linux.ibm.com>, mkoutny@suse.com
Subject: Re: [PATCH rdma-next v3 04/14] RDMA/nldev: Report net namespace move
 errors through extack
Message-ID: <amCmyqEQaMgJrtg5@FV6GYCPJ69>
References: <20260716132316.1495242-1-jiri@resnulli.us>
 <20260716132316.1495242-5-jiri@resnulli.us>
 <20260717132425.C9FBE1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717132425.C9FBE1F00AC4@smtp.kernel.org>

Fri, Jul 17, 2026 at 03:24:25PM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [High] The newly added feature to support renaming an RDMA device while moving its network namespace is inaccessible from userspace due to a logic flaw in the netlink handler. Additionally, providing both attributes silently aborts the namespace move.
>--
>
>--- Patch [4]: [PATCH rdma-next v3 04/14] RDMA/nldev: Report net namespace move errors through extack ---
>commit dd68e4a951ab0b58504bc034673213514633a1a1
>Author: Jiri Pirko <jiri@resnulli.us>
>
>RDMA/nldev: Report net namespace move errors through extack
>
>Thread extack through the existing net namespace move helper and report the
>main failure reasons from the core path. Keep the existing move UAPI shape
>unchanged.
>
>> diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
>> index 77a7580801486..8648e95700bfa 100644
>> --- a/drivers/infiniband/core/nldev.c
>> +++ b/drivers/infiniband/core/nldev.c
>> @@ -1195,10 +1195,8 @@ static int nldev_set_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
>>  		u32 ns_fd;
>>  
>>  		ns_fd = nla_get_u32(tb[RDMA_NLDEV_NET_NS_FD]);
>> -		err = ib_device_set_netns_put(skb, device, ns_fd, NULL);
>> -		if (err == -EEXIST)
>> -			NL_SET_ERR_MSG(extack,
>> -				       "Device name already exists in the target net namespace");
>> +		err = ib_device_set_netns_put(skb, device, ns_fd, NULL,
>> +					      extack);
>
>[Severity: High]
>Does this logic prioritize the device rename and exit early, preventing the
>namespace move from occurring if both attributes are present?
>
>Looking at nldev_set_doit(), if a user with CAP_NET_ADMIN provides both
>RDMA_NLDEV_ATTR_DEV_NAME and RDMA_NLDEV_NET_NS_FD in a single message:
>
>    if (tb[RDMA_NLDEV_ATTR_DEV_NAME]) {
>        /* ... */
>        err = ib_device_rename(device, name);
>        goto done;
>    }
>
>won't the handler process the rename and hit a goto done; silently skipping
>the namespace move? This could result in a success response while leaving the
>device in the old namespace.
>
>Additionally, it unconditionally passes NULL as the name to
>ib_device_set_netns_put() in the patched hunk above. Doesn't this render
>the rename-on-move functionality completely inaccessible from userspace?

Both concerns are resolved by the follow-up patch.
