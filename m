Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794205942;
	b=pv5yXafjYMZcT3JAN0jGx3aGcjd/pK8A1Npr6p36P4qqLnReUdKWLaYK61yJC9SxGKMN
	 IErGfRSg64KLsrd2ciFn4nSJKBKIiJ9qS/oXG8Gc+MEmrxedcjrOex2dZL3xL0rFwx//l
	 HO616aOO1Nk70pTP/yCpcAnMdb4dg6hXhyxZRvDPxvo2UYQgpHHv4oHgH4PThh4oIWcZo
	 zwVKYieJW7jJDOOc952ft+j/A3oPpFaWRwf5GycuDO4+DEzTBKwzK8duOzK+hpcX3jOFC
	 NoSlYtCuwQCtZLnPSq55rp1/kUtzhNwvMcCtnEwPlyVvph+WkLCspNsGGjbI8Bn+ocQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QZs33ahiL/rRX/TSIXUXIWO0smKr2wOCf1yvZOVxMTA=;
	b=BoaAj/X6Li3GbgyOW0euTG/zk2rLaiCNhx121ANHtoCEsTMp5TwAYWWGbG3uIvgt7l5/
	 mQ9wHbvD1gac41GyoAJOFPQ5qrwZ8Cvsobj5nR0M7SKyHOqcVoTfDnIa/X3KMtsbIFHfV
	 xhkBfIqJvHFczSKfxU+i6d2aTXabcfzHj8tkgtxvm8eEwnmhgoXBM9vx6LvMyqNKfBBo+
	 AP8iP+v0rDiNx2xWhzDWOUiNij2+dDNFlDPASiM5EchIrV61nJXXwyPn6JOG73nciT7iZ
	 kE6jPn8JmCG0NoKwzOyq0sWvsTzlfhx8vyBpJFI2yHO5h3CQbtDq0sb7oVe4gnVbOQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UnmfHzla;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDC3606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 06:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFDC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UnmfHzla
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40e30c26a4so78113166b.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 22:32:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794205940; cv=none;
        d=google.com; s=arc-20260327;
        b=iTkrpTR9K8wtXnDQRI3vB7zKzgkgGAZHDGGqjd+8bn4BLHs2CcsJhj0XWzWLxxN6nv
         WuphU7mEkGIefCyaG5klkvJxvHcHMeF3L0ZpculyQ31DH5WXQpn1InU/NSrVzkVNqP5j
         CIzNO02ixSPsC/sBqI50X0PEQawRyuLJZrmz1y4pM2CqQoQi32Ala5sCZhjvcEDUq0PQ
         rGZ3W9DUVsZj4e68f4w5rwRBgNSIWIA82uqGrE08QP5n2kWNk5A39HQ2nNcUYU8x8DtZ
         f1MFfwiC6yejj5+DCmhQXpXq37MPttiYSlA+bWXERE9reFrd//oNq5wvxajDYOmn/wwl
         tafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QZs33ahiL/rRX/TSIXUXIWO0smKr2wOCf1yvZOVxMTA=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=UgfQz4ly/3slGgexpQaApA6Qe9iQn7RqOiQu8DoS5sFrN0+RCDeopaQ1a6S7kT0jP8
         EghqB6dG1G2VAMgBKphfnuRfFHu2w2p4crxSlpwfQ45h853Y1VJcM4ckRZCSnSwYjKXI
         7Dq9IxshG7XTLH7Vk1jfwExMgrYwRIGYvJpTHwYw7wK35p66q5C/E+qy6KIZvMfnloxp
         2zLffnj61CP+zelDDZ1JUeH2AW6hnMbs2/i4q7W3oWmqtFd9XBaAV+k8Rogzl5NI7hmk
         fHs418A1zyPqmtamKCwDphLgJKFeS5GZlh8dEdwAq4PAAvl68r9nwgwqWxX8tiFctlBp
         ESvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794205940; x=1794810740; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZs33ahiL/rRX/TSIXUXIWO0smKr2wOCf1yvZOVxMTA=;
        b=UnmfHzlaoRtG8alPiPtjBsba+Xq+cJpK0oaKkbG+YL1mf2+mwQBzZDpH6qLAavxI/n
         eMnxOVnHSkiP0KzU/ZeXFkkzu7sDU8UxeI1xgA/Zlf6EFA+KlZGQJ1r3c5FDBXZM3Xrw
         YnB2ueRX+g4IvIGbFtw2WF/aiEpUTcA8rLPR7TDnrNglP1WUQCNsLxDV6JxxYEqgM9M2
         ee8g9Nxo08YewiBUlbUzotYF2riV1WZ2zEeCBwsM1WPQ2NLko791aZ3LdBSFy/0mYjHM
         D6cHFwwwK8krbrO3B78GyGc1IyKYuQX8mxWhRdH4GfEQfEPn80nRjixHS9dkYLWWZJfx
         y0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205940; x=1794810740;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QZs33ahiL/rRX/TSIXUXIWO0smKr2wOCf1yvZOVxMTA=;
        b=ovGhpnyuehCwnT+p0Lyp4EVoCpRig6RXJvUPWb3TibI9V1I6fvZX5z5GoJIgvKz0cU
         7s4hK8yEA86XWDMDvpmufKW0HY6Ws6s4IAWHTltugWrXH1U+tqj1QOvmFhTXQDffAVl3
         6N9kVWs7A7WLJGcNBSSXYyCE8yEKxC4xkGDsz1rJ7UuZK3Fw+3FCUMF8bh2E9yBDTryE
         C0fPIs1IGvklpgWoO1ke1qwRP90BHZSEi06YkxvC1gJmYst7oj8qtj5i5q8lnjKpN+TQ
         763b0wGCNgVTUqeiMUcc4u1EdGtAKYcktsG+nfe6/f1UHzYk08E+ntaAIQapA/vEF+l4
         XHCg==
X-Gm-Message-State: APuU4Z8ampcFKI5ysXi/GdxFpC575KhIrr+sFNA1ab/DIs35+lXSKyFI
	PBg18kn3suGIBYtDzpe37owuwDX3Htv3UzH9baHgXE2ti+ZN0psuEG3SIdyFZgz+WD7to1fUc3P
	4BEgKNc5TqkW2GthQat1fyBpEkuUzxn7I3QQE
X-Gm-Gg: AYBFou2+KALK+r0K36hQrvgkJSy2EH5vIiydNiL05ycrVK8jIu3nE54Kl5SdplNVLHL
	3xbA5Fh7T+7Qcdz6e7g2hVzHCvvjv6qq22CvMwi9gP5Do8sJHRm121IS01OX8eADu6sG4v7WPJA
	qkKwY+/TWQeha2WqpyMNScjFcnxHTdr7hBmULv0RJRd8vQfY+hbYy/GVUZWja1NAhobWyp5Uxys
	DZ/BV7xfxDhSJm7v6uglXIM1MplX5Cq7MmtSISagFTINQhjN8uFMeH2l3EVcwzE99wzSR37ggkh
	T9qNqauyE2MqqcCDPKwZ/tC/m2G+aBs4cKVbnZfsBVhnZ5un/Egy1z5XwCvFOT2hH0UM5r0RFYH
	i5vUnZOlrozbg3wKNK5QYK4Ca/wu89Z1u0pwS3VYqlZ0lr96Gu7K3cttRX3aBPFwyuYgL/gkBaA
	29JNr4XleysB/xti3m
X-Received: by 2002:a17:907:3e13:b0:c43:b0ba:485a with SMTP id
 a640c23a62f3a-c4d527c1db8mr365598966b.21.1794205940173; Sun, 08 Nov 2026
 22:32:20 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109055451.17458-1-operatingsystemsdepression@gmail.com>
 <20261109055451.17458-7-operatingsystemsdepression@gmail.com>
 <sashiko-outbox-204484@kernel.org> <CAFGNeaj1q=cwNn56Ye2CW5dDLVDCyYkbf2MWEtSFNnO6GtkXHw@mail.gmail.com>
In-Reply-To: <CAFGNeaj1q=cwNn56Ye2CW5dDLVDCyYkbf2MWEtSFNnO6GtkXHw@mail.gmail.com>
From: "Operating System's Depression" <operatingsystemsdepression@gmail.com>
Date: Mon, 9 Nov 2026 03:32:09 -0300
X-Gm-Features: AclHuK9tU_JgWo75G6SwN0CJVoZI-eU5Np2VkOu12addMVMEC5uQ2H5tnO6RSUk
Message-ID: <CAFGNeagUG0Y50eZtsPsSJ+0q1uKhogBHxNnp6XJ5S2inbhw=6g@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] drm/gma500: Add software-only KUnit coverage for
 SGX page tables
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fixing, sending v2 in about 50 mins


On Mon, Nov 9, 2026 at 3:26=E2=80=AFAM Operating System's Depression
<operatingsystemsdepression@gmail.com> wrote:
>
> fixing,  sending v2 in =CB=9C50 mins
