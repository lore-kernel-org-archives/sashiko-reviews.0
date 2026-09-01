Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070A549B1E0
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 18:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286709; cv=none; b=sWvbnBca01VA5AMitt8wBRzs6vTUTCoMBtSNOjm3foqOwUmQu5bhOXI17ZdTPu86m00+grtsm3MX/R0g3spBnCDHoBk9F8KBlT7gR6rygWeOpp5NC450tt4HC9P8LZw88qpNp+irQxgC8wlUq8SvLtdsxqUrWbhJhChoVWFKJnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286709; c=relaxed/simple;
	bh=pBZ72VRxSWCTqVnwhIeZKXwNxvzthrHIPi/IWXYAElY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbuniaT0Urk/vEr2ZrIDMkPSliTQx7VUoVNAcMdx4xYJ4dP1E2+XdewkA6EsT/ajac4JM+TuAO37TJ8ZZnhy9Yaz+BEgSIpenEE2b13EtYEmyl3+ddnYCzrlZJuMbR1cKsgg1WWHDYRxSEh8up7FjpNZHxsAymjwF4O/UrwSeaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Rb7+tl24; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Rb7+tl24"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9309d4ea213so24821485a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 11:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788286707; x=1788891507; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAec6ocgrNZ9bmHTFibIsazabE23fPNzJ4l70BPDTDs=;
        b=Rb7+tl247aCshdua3bK9MpMUOU7pJ1DPZGFyndZgULZZOsMohQNY9CGvXmt+qruCuo
         KSURkibMhcQedQFpseqWRJ+UFSf13+bj/6CIVzF29D3GO7bxhvMeMcPd5e2CXgvUydpV
         zE5DG7Ji+TqcJKxwCqfAwY9FqXCcxUUZWoWy8hxY92TNLmOlhhJxMF7sVPCCtw0ZhbtI
         l0zZBt7Bnp9bnMw/DI6HwocXeROD2BOghdWbn34lzePU3+/fd+lsUkQSqSAWKZtLdp6K
         3gCNxORKK6x3Nq6z0QzjanH/B9MX8DVidCJ9fVifK9fpFqfBKK9MOXvmYPW0XVMjAEC2
         U7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286707; x=1788891507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAec6ocgrNZ9bmHTFibIsazabE23fPNzJ4l70BPDTDs=;
        b=agErCu+5ojegRXU90qDreSHVtU/janEino1/Gs8TEAMVhsaJBAoj64CTlsL8mFWjeO
         whr7DOZeex0JK2vT7cfLVeesWVjkVsM0M7bw3xef9fxkfEEfiLWG9I5xGH/goGjyvxFf
         CM3c+c6EOC61pfGdnIL8chdCDEdyNIYxdp8wFmQtvxsS29/E5qGQynxavLq7jgAAxg+9
         AmrENunrAOD2MjF+rosSs1mIKMTmlNog3Ea8f3BJZXAbwTfLwuUmIPXCh0z3vrBnq2Ki
         3aHPJAXd7rdGUv3hmTkL7n7t9wk4Ik8nIH9M0Mxt8leyR8xsHVcR4v2YNlm5Ks1HGiAd
         Ip4w==
X-Gm-Message-State: AFuF++likQkLg9gtwlyn7fJTxZL1qICUPo27zBsHbBigodET/kkdV9H8
	XsOFS1qwDJSxUSOlDnK3lpxbaqIxPYjWfqgTvyhtROPfw//v0TCum10AuUtVKNRsJNBASVwWofK
	n47JSefk=
X-Gm-Gg: AR+sD11P5JGSnr79PHU7ydpWH7Z5/b/zc+9QrxXwl8KbDmbXH3aIMBFuudn0yD6m7UY
	uGm6hP86vKaAN9xOyOtn5rFK90fKu4o/bG0rZYGAbzGPIM2GNNmk+03xgY+O0klKfblobDZ2079
	5YZwcK+QI+5BnJ02YWsGTgtWxT1INMIii6poKgWdRRE57aZ1oVFIW2WWB3AZTnw3onTjm59fHhW
	u7xyQF7XMZ0m91YCqgbNzR3pZX4i3vDVOhPrImhsViuAWhnBCR/f69Hd6zg14vJ1hnS42ozl7wr
	65XK+ZnUkmIcig/ERKgPn7tsff5piAC62v8FRdYK+xPWLRbi6IC+lw4s48FfDxqfkHIlKFsfvkg
	4cWowAK/TPs1Zb2+ZFYaE1d8uzdchWZefxl7KxThSUJp1lIjAtfQdvcEnsjRS5lr6pXduMzspoJ
	bwETMEB0W2oe/QNGMUIcw1MOl5nASoV+PPXd60T9oC7M/X3M+cLc08HryuAQNvgg==
X-Received: by 2002:a05:620a:6b4b:b0:92e:541e:632b with SMTP id af79cd13be357-9395ea57448mr49706185a.2.1788286706748;
        Tue, 01 Sep 2026 11:18:26 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f157807sm3232985a.9.2026.09.01.11.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 11:18:26 -0700 (PDT)
Message-ID: <5fdaa7b9-19ed-4947-8ef2-040287e2860a@riscstar.com>
Date: Tue, 1 Sep 2026 13:18:25 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: monaco-evk-ifp-mezzanine: use dev
 for device nodes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-5-elder@riscstar.com>
 <20260901175445.0142A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901175445.0142A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 12:54 PM, sashiko-bot@kernel.org wrote:
> New issues:
> - [Medium] Mismatch between the commit title and the patch implementation regarding the new node name.

This was indeed a mistake.  I will update to say "use pci"
rather than "use dev" in the title.

As an aside...  I initially tried using "dev" for these nodes.
The reason was that of_pci_make_dev_node() uses that convention
for non-bridge nodes.  This was introduced by commit 407d1a51921e9
("PCI: Create device tree node for bridge"), and I haven't yet
gone to see if there was discussion about that choice when that
patch was out for review.

However DTC complains if a node is not named "pci" or "pcie",
so I went back to using "pci" for these endpoint nodes instead.

I personally think dynamically-generated devicetree content should
honor the same conventions and restrictions used for static
devicetree files.  There isn't an automated way to do that though.

I was thinking of following up with a proposed change to
of_pci_make_dev_node() to at least use "pci" rather than "dev"
for non-bridge nodes, but I'm not sure that's the right thing
to do.

Comments welcome.

					-Alex
