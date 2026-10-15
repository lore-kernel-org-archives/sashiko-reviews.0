Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6503853ED04
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079614; cv=none; b=dHxBTHgCjGae1ZtFXkGBAxh8VoJrX6tKVfuX3THFO+U5roRn5y5D2KDcbbHUy6DVb/JZbyu6LdC0wePsj6z0iGrA69uM3wECwiFF0Z1r+gY79NVBY+Om7rnYjizyMwDjj+2j8WXwVPFvRK83q2vncSiC21KNmraazvyTPBI/8qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079614; c=relaxed/simple;
	bh=66s3jvwhXqXMXCR9Ls2z2H5ucQRaoo+W9r2EZWBUsio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gREnQyHsdXimS37fUWAsPAsKywiwsw56/TG6m69mVV6e2JUg6QlZTih0UiY3X8T7lf0tCL1cesKVHAQGVbrGGk3FM3xdcg/k4GIpI3YAdy5LxtWESeMgYMi3F1Q8IEtvpXbQX1EpY1H2QCuQwEABoD058BM0x0I7DDsoFLu34Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=k/SJP5mZ; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="k/SJP5mZ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CBFC5B0F43;
	Thu, 15 Oct 2026 17:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1792079599; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=P8uMpuYezBqzKJmVmRZehSXeoBOm5K3zdA8eRcmME8Q=;
	b=k/SJP5mZk4iEscs/wlZ5U0GxL9O/sHgGanrzEjZpi0KAuKcemTfNifRSSjJf+2Cj/8IzgR
	Be/bZ3cNCGEJRLx9FG6Rv2s8E8u4PHt+wfXhnBJnHNpnUeVfkooKTdp08CFq1r39wFJGgo
	UY/d4Uu4CVZ328PlKIJxm+luvPXAYpjxS65Hao7SnqOk328F+FMqQTE8MFa3o+0H5+H5EA
	/yoOXjMXWc7JE2XwtWj1N4t9hOiyX0SoJAsvp6k1sNrz5R7/BnFd1f5HiP6qattRUGtJ83
	hGtcRXeBXqEWUR3pLBXGz6eNEugkM//5zzIf5umKfSuAk20I53a8jYCV0UbIBA==
Message-ID: <dd85a784-aa07-4b17-84b4-16a138c3e4e1@cjdns.fr>
Date: Thu, 15 Oct 2026 17:53:17 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v10 4/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261015145331.453837-1-cjd@cjdns.fr>
 <20261015145331.453837-5-cjd@cjdns.fr> <sashiko-outbox-173087@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <sashiko-outbox-173087@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

>> +		return -EINVAL;
>> +	}
>> +	if (cd->irq <= 0) {
>> +		pr_err("%s: missing IRQ for CPU %d\n", cd->name, cpu);
> [Severity: Low]
> Similarly, could cd->name be uninitialized here for skipped CPUs?


This is an easy fix, I'll send a v11 for this.


Caleb


