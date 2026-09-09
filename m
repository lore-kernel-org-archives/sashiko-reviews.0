Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3379233557D
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 03:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788925358; cv=none; b=U4RghkYYjfvVJZWIdF8lQd3QaQ0w++MWd5zltVh8w2Z/r3NjPXTbowAIPEy/NCWN8NE5aLtwHK5OHP+PSwLgq6uF/GoGa1kEsCBMkiObY/wwyg8sNyjMup+rWXsXfVbfZyoRff+wEldTsElXyRsal0SLyp2Ebp7sf0NrNbFwuTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788925358; c=relaxed/simple;
	bh=DPG9za4oXsJpy7tSykLd06q0WG1pcqzSVZJNeYro8wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2bpJUih8RsglMo6tWFGW9PezujBzoR/seQ5vFXWQcmRxK5djXm++HYLDToup6AhovRtcumqZu9IKPROrHsdqXRZKV5rWXRuZdyr8Ux1+WR7KjCxTtZdClmC0vuOmVNs9G23hfRtF07tjdDPvN0GKu/970Y0189qmo7rKqdaZsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b=eDojvma5; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="eDojvma5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1788925334;
	bh=S3S48v9NyNCygvo9ANS4o5ZQWKXiieL6rO7xfL97yBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=eDojvma5PJOHwvlA/LgzO5UmoFaiDJaJ+589eBlp4AhGEfb7tWeQI07A2f1XXvFjp
	 r7FE2mXlY4f5TqDnf/O3W5UkKh9RkAzQhJnIKnB2JwiGoKzmAHCo3Pp6mvW3IKTfAj
	 qmLtv5Gm8wdvI8F0xZxpKyyfaaA/tIeQG6IozPyQ=
X-QQ-mid: esmtpsz18t1788925330tbaeb4760
X-QQ-Originating-IP: mQAzD3pkNlHdp5jpzSQImebKhWrNlUia+t09hwY2gow=
Received: from [127.0.0.1] ( [124.70.231.75])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 11:42:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12620112044545498370
Message-ID: <1FD435BC6A08027E+0a49ab9c-e991-4af0-b484-b57ee65cf79a@smail.nju.edu.cn>
Date: Wed, 9 Sep 2026 11:42:08 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: fix memory leak of fence event on execbuffer
 failure
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <D320EAB5680C1411+20260908121323.2405044-1-peiyang_he@smail.nju.edu.cn>
 <20260908123440.84D501F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Peiyang He <peiyang_he@smail.nju.edu.cn>
In-Reply-To: <20260908123440.84D501F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:smail.nju.edu.cn:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M3ZkD08p3wd5I0LmwxsEQLQRT2YADXbaboooCybJYRBELheiyV+syXNJ
	m480R/FBeoV4V+WxLW87vJX9c7qPfKe0RQzjOcNLKaH/wZsa07Agqth3DiKuZMF39xgjZBI
	aa4Koudnk/jMGlzyA5bQpxrqyAxhx54/hI/Y6dpVEIOF7xiDwta4ft9/UT+cdNvi3rhjDEK
	rA0FQkpSVgYnpkCR3ZNfF831o7Ip9XBOUK4SatM4ziD+wo5oJE6huJDxU557XAq/6gc8scM
	5DN7MpUOg+3Tct0k335m7+Z4dII750WWmpp3DL7wpELCrQdv8eVxGVv5WXGPjhks4ECBm4y
	c/jYHRJGIjLInYR6RqqNTdh3dKt1qZST8GYNPvYCFAvDEdIuYMUmM8juAVimHNCzPh1idEO
	INb9DopyMMHhQA9F3E4IODDvoUD6kMP0gbs3hygsIxctIEz6tIWl6F/sYyNnaQhHiwVjSjS
	MbZv/EuIfxBGLLgdMI5XZN3guUtXCpzY4Ym/eSH6Q/9WqQu1Sp1qdEWzd5+YQ4sqofkkSuj
	xHYtZwTvZXG51rdIN9nqlI/vYiiXaCiSplcG/3q/vIfhhwA3jQlmtfu4ecPLRGjCvtbDlaH
	xvlTbAQWZWIU4ol4eGFBdcsNGhKDZBr5ntQHiRu4lppaUDSnujNht75rDcvZn4OpZo9btsR
	r6+hRKNg7XpU1LelBIUTqO5iZBn22S8YZNPVZqud+kFbI2IdsL2Z9baUILT8mYNguEUpl1Z
	qsDmIVSfkraxC0Tg3n+ysrNdMaL0FOcYgJEXBFVRolwHWlvo1ljIY2ipZg686Rkvu9ZtA2I
	olSszA6v3Mpk30n1kvTRsjgr6nHroq0yacX79qk/VREevG7WA/JETKIP04ae2Mq+L632cRK
	5HWQ4uXTB3nTgQ/ONzkNAe6PCljIVW0BSRTLjw/q2wNZMi+iJ9Bf+O3EIYMp4k6Epj5z3lc
	hqHeczDhRawDskQ5ArQZgP3m1i87ba8q963F+MKb5zDOqj5MlcwqdeUyp6b9OnVsV6pgVIw
	POwYwdn6ugdalUd8F3
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

On 2026/9/8 20:34, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This is another pre-existing issue, but is it possible for
> virtio_gpu_fence_alloc() to fail and cause a NULL pointer dereference
> earlier in the submission path?
> 
> Looking at virtio_gpu_init_submit() called earlier in this ioctl, it does
> not check the return value of virtio_gpu_fence_alloc():
> 
> drivers/gpu/drm/virtio/virtgpu_submit.c:virtio_gpu_init_submit() {
>     ...
>         out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
>     else
>         out_fence = NULL;
> 
>     if (drm_fence_event) {
>         err = virtio_gpu_fence_event_create(dev, file, out_fence, ring_idx);
>     ...
> }
> 
> And in virtio_gpu_fence_event_create():
> 
> drivers/gpu/drm/virtio/virtgpu_submit.c:virtio_gpu_fence_event_create() {
>     ...
>     fence->e = e;
>     ...
> }
> 
> If kzalloc_obj() inside virtio_gpu_fence_alloc() fails due to memory pressure,
> it returns NULL, which is then unconditionally dereferenced.
> 
> Can unprivileged userspace trigger this by invoking the execbuffer ioctl
> under constrained memory conditions?
> 

Our fuzzing results confirm this NULL pointer deref path is valid.
Will send a patch soon.

