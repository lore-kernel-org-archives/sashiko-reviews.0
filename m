Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16B13537EE
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784572589; cv=none; b=pwaYQximwXaXQAAQ4Gfs06jVhT5bAu5P4qUa2UsFs71xyVXePZfkA2xXpWldR1A8j/H82fl6EluSn8W2gd6o6PwYQsrkqNWnYCuhXmXKfj/DZ0CtPk23tTgR3l/u8KEvCOb8jhMmu1MKR9k+PxmtX/BWmrmHEuf5VgdvnWffHlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784572589; c=relaxed/simple;
	bh=HBO7t+Ert+oqgjYT9uCQMkAftwBdNildjn+bN27LNfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5CoUvJdsCFET+p1PKZXQgTWPxwudUBSx9aIFpxvcXxSZzOK/JsVweRjpKq5GjfB0aArmt4DhFc823UbE9GRyZUXXUfFURGc/5qsl0NwXoVX2SVm1anaWOC2X0iFyTt4nL57K0BeGIJ8oX9R2wv0yCSzHWvNQrd0QOuwRzYc7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SeqCtsMn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SeqCtsMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784572585;
	bh=HBO7t+Ert+oqgjYT9uCQMkAftwBdNildjn+bN27LNfA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SeqCtsMnLuhAfpsgzsNPXUktmJWaZm2klMDqoy0wj/pvKXCA5Khe+H2ftMXQWwAZE
	 UWWl5Ae2AsfZmiLEtH2Dwj7qnbnLQCJ3bcikmmzGQ7yCu3/1+8IyESHDFXDvw5CmO0
	 a6P7678vkaR5o0wUwPImh62lV3jEmeISBpw6n0foWhZIh4drnCsvx8DuOjSQzx12Dh
	 aJwVBBLF4RRhKr9QWAZI1lTT7sGqTM1eYMhANk96ihwIuCSzkeAXeXdkjD2Q/Nsjoe
	 qQNzIi/Dlb5oIFb6xEpD9OCEjiVmUmr7t+jtBYSEPCKV+/qGUCDp0MFkzp5PLSGMDJ
	 8dMQtRv+pHWlg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FC7617E09AA;
	Mon, 20 Jul 2026 20:36:25 +0200 (CEST)
Message-ID: <2f2cca68-34ee-4f12-9fbc-77774a7f71d4@collabora.com>
Date: Mon, 20 Jul 2026 21:36:24 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] phy: rockchip: samsung-hdptx: Prevent
 divide-by-zero when computing clk rate
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, neil.armstrong@linaro.org,
 olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org
References: <20260612-hdptx-clk-fixes-v4-2-ce5e1d456cda@collabora.com>
 <20260611235702.0E9691F000E9@smtp.kernel.org>
 <90ac7bbc-977b-432a-9f17-b7280e19d819@collabora.com>
 <al4sQ1kNriKH7hHL@umbar.lan>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <al4sQ1kNriKH7hHL@umbar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Thanks a lot for taking the time to review the series!

On 7/20/26 5:10 PM, Dmitry Baryshkov wrote:
> On Fri, Jun 12, 2026 at 03:18:52AM +0300, Cristian Ciocaltea wrote:
>> On 6/12/26 2:57 AM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>
>>> Pre-existing issues:
>>> - [High] Potential integer underflow in `fout` calculation when hardware state is misconfigured, leading to a massive bogus clock rate that could hang downstream components.
>>> --
>>
>> If the hardware reached such a damaged state, the kernel is likely already encountering more serious issues.
>>
>> Regardless, I will address this in the "FRL TxFFE level control" series, which is currently blocked by this one, to avoid any further delays.
>>
> 
> With the overflow handled:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Since a new revision is needed anyway, I'll add a new patch to handle this in
v5.

Regards,
Cristian
