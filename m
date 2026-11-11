Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794402604;
	b=Z/QbQe6JqzgmA/LQgxqR5miH5onk4Ivkp5phGKMiHz8qKbiNveQVM7f3/T/DHs/emnvl
	 AsiekLDXf9oQGvpsqLRz+NN2AUgKNbLtwQvtqVKl2fV+nXWNh1emj/j6XR/8aL9P8zLAO
	 6KQ21FsNjII8EcuS6YAqqYZkhUvkqbILBgI51zYg4foDR7Kii8/F2xhi+9pDz9d+PIv+h
	 ogS31TktmpN4iTpEVD+ju18UrFBS90AALGJfoSOoZDfSvUfSFkcSFhwz7sbpjQAnAzp9q
	 DbBIJ1vmCfoTbgopXLJHGfKqLIpGXcf9fVZ24dmKPR0CAbsMeAPkPBwdfx3gsfDp+Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=50VbJogchqDQzU8HRSzVY3/9D6QJQ+rTsM6+rMs8oJo=;
	b=Dp0dzVYZSxAXUlLEfEr1ovfJLTaNB5OWUI/KbXY37ZNpuqXrg3JosggNhvtZnlSd7Rlq
	 hkz5wJ6qvBQKyqIIOWTmINwzS23b6aX0dzp3p1+6PMpOFFQjLPlJPZwdf9McJvcvD0sAA
	 exR4rET1eYyXRLPX9oTRnP+VNlJjVvP7IobgN9oaVt8+pEPKEB9HoN4Rps0TuV5lVvf4B
	 NPgERgB1jelHmekyTnQy9ogozTbOHklsQbID7aYnVI4W4PhBZGuzCbFh/eHurpv5LY9RF
	 y2P+KDDABX+zmpMQmRvIoa+fbScV2knB2xqTzqIv1++2fcet4hjvX1XnUaYfS+jp0DA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PaG9lCXb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E7D606A324
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 13:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E7D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PaG9lCXb
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-5681e6e7818so1249393b6e.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 05:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794402603; cv=none;
        d=google.com; s=arc-20260327;
        b=nNeKUlO0Mu/GG7YNoP72ibMn0vFQKER9V3ZRnROivejm0M8w1X2799GMxmK9N0Kg8v
         m824mSo4E41Qrtyoazws9fxRXDZCtfbQMGZNXCbVfI2UPaCddrVLJv6bZ2126EAhhltE
         +U2lPWMgLUbhpaZtNlGC0bEDPF3fCEWwNqJoyja8g9DnJ/2LMXdkauboYrtz22BM5wMZ
         o6jL3FBFJcjPLXY2VnwfV/CCuO7Op9tOj3lslrzB/RSgnFENJucgRMg8Jz0uLGVMOzgE
         PQ/W4DPfAPDnXJXm76jKpbdNh4sIKIsNNIgEtmQdHKBdshl/BFNcS939lpf0FaZ5wOXz
         j75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=50VbJogchqDQzU8HRSzVY3/9D6QJQ+rTsM6+rMs8oJo=;
        fh=Si6J7aZSpytN8/EYrRjJiKUNQaMN86j+Ompq0+idjHg=;
        b=F1ou9TdYduC3pCdqvxaLZFu36YiTnHuTIdzp6UAgSqSJuptS/4yfLyBQY4exp4Bqto
         OzpDrIdGKChFqnJBrQWZPCaCVBHyLSbqde9ZeJCE8gkHi3n/WZ0qOc7YFkY8QznWUoAz
         +KtRd+o567PixAo5BMeVsG3h+Km4tdnlbQu0RWoANvMn4NA0yE//7GABIvvl1DXFVvnx
         ww5RfRbULztis1ruiO6PSN74X0ryHDGeCKhqf3+qJXDefxXmq/X64TMLv1dqzfBLSDKq
         pHpX5q5/Xs2d5XkZZ2k3KzPiSaHORxwHtYKN7gdfLTrsUEHhDKWtg0amM3paqCPGvgPF
         FJmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402603; x=1795007403; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50VbJogchqDQzU8HRSzVY3/9D6QJQ+rTsM6+rMs8oJo=;
        b=PaG9lCXbaBrMi4GQf5mN8V8rCCkgbJzMqYcMIOLe+2D3h8f1h5nUt++eaVms0P18b2
         TLN/63yyfu+8is+qnKtiL4v4Pz9Vnx/3KOLjejopHgFYLdRb4mBGvUxP8wBGHK0egVJQ
         OKtccEDY1g6StaSvM/Jet6t/tWNz83lHos8pWtZzpbwlIlP40n/fTOdtmHaqCJij269J
         2Kual5wwR76lajRO2OAnwuNQtQROkYirRqP6ZBVSOaD7QOWS0HyN6L+xf89jKvzjvWnD
         mGVM/sCQNgB4J/BO8nZr/LiPXoKOvQyMDD2ZZzoxTdO8PMDRznMhqKx+VWDyFke/GAXw
         FTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402603; x=1795007403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=50VbJogchqDQzU8HRSzVY3/9D6QJQ+rTsM6+rMs8oJo=;
        b=KBiOT1Ha1c9xgnuDB4AjjXxMiNDdPUwufeBnPdG34RdkCu3of+AXvIIFrozDxjf+3L
         Fpsr7vJzOh26N/qkDukO68Ox8wfTW4VTC3PPmMwR+wznPSlXy+1EVapcFevx5upDxuy7
         yvyTDOcm9nhKE4huETSyC5IEY/zGZc/n8UhmmsTROE5G0XgBE79RHjn6cVmaJlgBST/3
         0myyaWNi4ONG9CLjXMLLpQ+d5dRLBTQc4akYB4TWRXV9B1n4nCDwguQbGcapdJ/6G5wK
         XZ9LKlixF6IUax7HsmDKGztxYjq8nWp/xSkqdaGCpU+pQAXR69th+vJPtvVn8z4Dv3n0
         JYzQ==
X-Gm-Message-State: APuU4Z+h7DZNHUb2YwsefzoNqmChIHnr1Y14aahGGBwycHMAdTWXPlv6
	AR8fsyouF/DRTu5FErcSJF3Vyhto/cyImJ7RGNm9qOmyjIYzVftsgEgUx/+ydf/cINNOMBn5FVB
	MEsOL+hbcWa0LkaRH4z2tr2CzusQzSqI3lN7kUyL3UgZG
X-Gm-Gg: AYBFou0DTG3tR5YpR3yjLCGX3aWyVhcnLPZcnoiO7ZChlIzCJxs4KOt6iAN5xiwynND
	3hzp0RPYEG0O0y0f6WOOtXEzm3zYaAMiTLzZqpIo2CWpHRQASGDcVtrAD2rWx0LaEnKfBH7aR4c
	exoJ/tHU8R1DRtO+W9hivieW5+d9wkkOCPyovCaZQMw13VoBQV1hDgQ74Oubza9RpVGuUkLqpp5
	TVidDxQz2w98QWp0+L92taXfKq3+LEbg/j+W0/m9YGrd+nWeqxnYDuhJ1aqTTxIJRg4Gpn7rrHn
	Bcm83aWJia36hLxwegHBR2YoNbG6qpDCIHtrqwuiLZGaI0nDGubNjAKaOPT8oKsAWTRohvTVVKj
	ilftzOlooSvzTQFh4xRt5mvggjEONPuM9mVeMRfkG16pndLs56+fCMk6ICa2ZtzazxH/MY9VOFI
	HM2piKGM5GJgHZatj2ht344MlVusYSN735JgxLqtjyzc39wxVFQeAoVA==
X-Received: by 2002:a05:6808:244e:b0:4eb:b0b9:2dbe with SMTP id
 5614622812f47-56b96ad3458mr2053423b6e.27.1794402603366; Wed, 11 Nov 2026
 05:10:03 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027035857.72265-1-dennylin0707@gmail.com> <sashiko-outbox-186069@kernel.org>
In-Reply-To: <sashiko-outbox-186069@kernel.org>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Wed, 11 Nov 2026 05:09:52 -0800
X-Gm-Features: AclHuK8LUmufgTJ6wUMSDnUFz420gwBNsdzneZ2MWjHdnCLxbW9xM_w8VZUeQqE
Message-ID: <CAGEkeHeXWmu-m03CQJYXY8qiS=zreF0DOmS3TdQNaPPpiruoMA@mail.gmail.com>
Subject: Re: [PATCH] ext4: preserve force-fsck requests across unmount
To: sashiko-reviews@lists.linux.dev
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

Hi Ted,

Just following up on this patch.

Thanks,
Hungyu
