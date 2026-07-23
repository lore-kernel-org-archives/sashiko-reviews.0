Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC33F3D1AA4
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843316; cv=none; b=KwX1IYEtIT9w1oIWKMOuaSv7SHYaFOGAzKfVRodZgfktQXnJwR+1zT0THmlDHAK/+uEtvPYYnTzSR+dxlFN6liyjHwNuSmYkGPvYJ14HNw810BP42sK2rK+xNwsi5SYQkbeVOlY2bGrH4caRYnGyvoC/DVCbTO84aNWI5r4SvGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843316; c=relaxed/simple;
	bh=0DKLloNkB21AKXQThOK9Wz9baK2f0lW80gZlTFUCfVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StSkow4zoF4LUzVzzgvL58tTMz2z8GIihkTHrIL02PgMoTnyNNDBayG6xZYNcpD/Fpj8JC0YkM8HIbuEtJ7YLQd6rqFk/6WuC/8yajaH1PsnWSr2Zb9jo1JbFhwte8vtLv3XUZpNbMnAGSHoPIl663kLcowpQA6+VOr394xl74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k3nlLFv8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k3nlLFv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784843313;
	bh=0DKLloNkB21AKXQThOK9Wz9baK2f0lW80gZlTFUCfVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k3nlLFv8ACJTu73Qgt70Tqeo8QC4ZWyGnDBDSqKTQeLWU3prsl67S/a9sea3qS618
	 ZFa0TItBMoxfpdFh4pqM8u6CUKG65IRSrPgmCnelf2v4pngvBNEZVQVryJo3QqUORP
	 zAw7q7zHbwoTKKLCt83fbH05adFbHm7zn3iwY3nO9is4DjKOF1En+Rnq3BLbAfDBhe
	 FIz6yfn6PhE3JaRERuEPXbBh0DMmpYhYq++WYrfkUx4kZUzRT/9IErrKFJF/hpRwed
	 coOueRVA2nVxt1OeXWb/9+ayCRCVaJOsMyTq9ZQ3qK18R2+uLKtXf6I1LhQcpMUEZa
	 GCYlIikIliaig==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C92B017E001F;
	Thu, 23 Jul 2026 23:48:32 +0200 (CEST)
Message-ID: <84a30b28-f003-4ead-968e-641517fa3d67@collabora.com>
Date: Fri, 24 Jul 2026 00:48:32 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] phy: rockchip: samsung-hdptx: Handle uncommitted
 PHY config changes
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org,
 linux-phy@lists.infradead.org
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-5-8e786067865f@collabora.com>
 <20260723200041.0B3DF1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260723200041.0B3DF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 11:00 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Ignored PLL configuration errors lead to silent hardware failures and a permanent power leak.

Already discussed:

https://lore.kernel.org/all/88624071-de6b-4fd1-9984-f79270c2979f@collabora.com/
