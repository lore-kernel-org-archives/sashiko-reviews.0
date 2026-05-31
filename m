Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F40A1FC0EA
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780236148; cv=none; b=hdCk95Jxqt8gqv1JKWf+K3cttgEgLwQr+nBl/BimSpMksy1ollfrv6dH1GmrRZ5fU89lBlWxVFOMlxDKNFh3/8lS+onEzklEj9O9cMZKQtYtPBbb2dbQCAfIG38av/WanVfTxstfu9mhixdiTFZiTvkvkcSG0cq8RYmyz1YFPx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780236148; c=relaxed/simple;
	bh=C7u8j+8ZuEu/hvPVjioug/5U81fzqILw0tnmGXAPFok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qcGmEyFjKxbdJCwEJJlxC8xTUJSfOG6Jyw+jc9+IG9T/jFwplTwztpx8LNhZ48x/nKrvcEeG3LRyuze0sILcF8kCqy3El82sw31yssLPVMWmOS3MvDlIZ5xvtKqO+PnVjyem0sEq3Byd+j7y2iUZlydDdeF9aAGLroZKyNOP1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7SF3T3j; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7SF3T3j"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304d7f31215so3160299eec.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780236146; x=1780840946; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgnkOucJ4lynEbyGWzUWoBKHmcQTYyOypcyzzzs1xrc=;
        b=D7SF3T3j0O5Yv9RSjWg6sy5fPZWAhOerDY0YftPWqDf37Wse95c5wUe7OBxTZhS9YS
         TRYz2CSeHS0qFklYdSouwVp3lhh1RgsAVW90c2IQkH0NlUOEKIyj9CL2nryGmxI8+NgV
         wSSEJxYx1BpsQQc/l2ng+gaWA2jvWhRT7w0iXP1VYjks8QVKYCZEZMLe912ZJZOtESCq
         wUTGW6TkiNn7ltkqzhen+Lob9mSfGH5baZb75L06b3ji5w+sL1R4Iw6us3MVHmA/ypdS
         BnhAyMzHnsMsM3AbV//ezCOiGBABFs68+Rlz9cwoJmg2qaYajpgIAYwbY3mQzrMe+e33
         M7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780236146; x=1780840946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgnkOucJ4lynEbyGWzUWoBKHmcQTYyOypcyzzzs1xrc=;
        b=Zj6GdEizcMIyQwtrU2IolJoM8gzE0xqnP8X/bN2YcxxAoahUDYixPSWHusAAh+E2nH
         +MwgUjNIBibW5SH6cZ+BVMRhKbxtfuEv9YBQHE3el5hkchMjOkkGV2iKmlJY+rgL1hQX
         23HOEGoDgoxOPTjAxOMqjUK2rdtnh2xbYfrnNzVL8FWvc9wF0lWGgLjbDWrDqrdXJ3nI
         bq+3vaMzEOvuxceD393lSTJv8rLDAUS/tNwsgf5FVZ1XgiceG8Y+nsuiCSi2kcvCCzGZ
         gcUPsfgWQ8YR07znV2YX5BZ+CI+SIvNWS41XMh+Ix3kg2dQBMBenePT8Qi9xLyS4O+n5
         FOEg==
X-Forwarded-Encrypted: i=1; AFNElJ/2sF10jJNgsMVhLIDik5pU4+qmjdfSuVaXegbtw30zf5wfDcA1Ca5W/ZzHyXSTvNe7zZ9VuIUZUIG3ZvJM+1I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjIT587fl/YJxKi/6e9iJ2HYo55ttrJiml1tzs8J/qmCcbHLV8
	/kyiblypRmXx/dFdOiJzPaNOLwl4Og+7GqUIGHvG2QemPp6rztK67hNL
X-Gm-Gg: Acq92OFWi8quICk0nTzt8BypOcL61WkHoAbdMihWAYPTIy5v6u3MIIuIEvLZH2r+Bap
	OZVvAH+UjWo0Isa/NLb3+D5A1KXlpPoNmad4hA4R//J2Yba87hnkWDYDS/k3ahvdw11gS8Bj2MT
	0J7H0Vxf4nbde/3bBKAAauCmHflRN8Dz4+vA0zrJqDUpBltxsin8lNf4HxjAlagH7QzDoraxfxM
	HESWVDVuizey+IOQpDIYLf/khEfGmvYMrcfc8Ph0YYGdf2K83W7TeqNluqox/58e/B0YZfuRTlf
	wEB7n6wLWP9fP6wMsCijCpxkrWQPWjQsZ7kz8lBu6iPwpgjjeDtT3+2o13GeDZNGslT87v966fv
	hcNZHOJS2YdR+pzV8Zx/gWWzncG1lRjw0vvCb+iaxfih8HyeQCeA46g3pVuWKfzclcAoC5TibFZ
	BYndT2TTBXm923ksnS9asr6QF+7L2TSOYlJ0rsFbNBceTmAxfc+Zrfcn6EuA==
X-Received: by 2002:a05:7300:3246:b0:304:6448:dfd7 with SMTP id 5a478bee46e88-304fa5e85demr3452313eec.18.1780236146056;
        Sun, 31 May 2026 07:02:26 -0700 (PDT)
Received: from [10.4.72.5] ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d14fsm6449412eec.17.2026.05.31.07.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 07:02:25 -0700 (PDT)
Message-ID: <10054db1-413b-42f7-b38f-f562b8de432f@gmail.com>
Date: Sun, 31 May 2026 22:02:19 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: Validate irqchip index for LoongArch and PowerPC
To: Sean Christopherson <seanjc@google.com>,
 Yanfei Xu <yanfei.xu@bytedance.com>
Cc: zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org,
 maddy@linux.ibm.com, npiggin@gmail.com, sashiko-reviews@lists.linux.dev,
 pbonzini@redhat.com, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, caixiangfeng@bytedance.com,
 fangying.tommy@bytedance.com, Sashiko <sashiko-bot@kernel.org>
References: <20260525070154.495455-1-yanfei.xu@bytedance.com>
 <ahoYdrs9dVzp6Ps6@google.com>
From: Yanfei Xu <isyanfei.xu@gmail.com>
In-Reply-To: <ahoYdrs9dVzp6Ps6@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026/5/30 06:51, Sean Christopherson wrote:
> Can you split this into two patches, and send a v2?  I suspect the reason no one
> has picked this up is because it straddles two completely different (sub)subsystems.

That makes sense. Done :)

Thanks,
Yanfei

>
> That would also make it easier to get the fixes backported to stable trees.  PPC
> has been around a lot longer than LoongArch, so I assume the PPC fix will need to
> go further back in time.
>
> Thanks!
