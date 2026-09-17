Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BDF44AB6B
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644351; cv=none; b=RBAshJ8g3O0dvlMCxyj7kjAdT6jWzUSfZajVkT7iFMpQDkPt3/y6eCZqlrR3qzQ+2Nub3MXOTYMJWqfao2rQ2vd4XVt2WvSMVLiAz0KxNFsZBdud7PjiHXhgZJ1HA4VjrmQeZjAduRIaW+qqInKFX/pNyuP/xVpG5zMEz/A5VSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644351; c=relaxed/simple;
	bh=S0MxfZagSvPcH0g6UcHQoyx/UrFsguK7ywCv/KWajfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnscNRla1MdT9A0/OM/G6s1t2A+VvdN6OwVTD+SnyjNGAibtuESGJgpPDrf716H9jFRPszCO8eBi65aw53gnxmyXE/EXqzp7ezy5QW6PPO8ddW855P72yTL6yPQqxsHfYEsM/amADY8k2ZrZABJP8NAT/syQkzm8zZx0iHAadg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 68HBPfsM025012;
	Thu, 17 Sep 2026 20:25:41 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 68HBPfw0025009
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 17 Sep 2026 20:25:41 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <5142b092-6a2d-4eed-a768-eb633f90f25f@I-love.SAKURA.ne.jp>
Date: Thu, 17 Sep 2026 20:25:40 +0900
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] block: Add post_release() operation
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org, gary@garyguo.net
References: <a1a4739a-27c1-41a1-93f0-905756fee0b9@I-love.SAKURA.ne.jp>
 <20260917105317.C100A1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20260917105317.C100A1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav114.rs.sakura.ne.jp

On 2026/09/17 19:53, sashiko-bot@kernel.org wrote:
> Since the module reference is dropped and post_release() is completely
> skipped in this error unwinding path, the async work scheduled by the
> preceding release() will continue running after the module is unloaded.
> 
> While the commit message notes this is safe for the loop driver due to its
> internal state machine, does this break the API contract for other drivers
> that might implement it?

That problem can be handled by calling flush_work() from its module unload
path (like loop_remove() in
https://lkml.kernel.org/r/9f1273a7-6dfe-46bb-966f-fe08876f4375@I-love.SAKURA.ne.jp does).

