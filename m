Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425919;
	b=jZcmqscKimMRuNQglaGCefzJ9mfQoeM/vg4vQgT2vDBhIh4d/P295K8bA1t85Gaunebr
	 /unUcbzimRilENHJ3kQ2rQJ17tW9ELXLkywCl350k4v/gArYO5tKse0IiO6sK82uKObMu
	 tcmQzshr7m+Dpb5V5IJwFfWbHll7Z+YJOCQUVK6t/bUF5ogPPVLRnzps3hhjUZydnXTEf
	 KRduc8Lx1s6VgppnsnWN8KZfTy3YLpX0dC0jK/m+JXgu9C7TrHLRFJ9LJUetOlfXj94Ri
	 nuHoQ3C3lBmob1Pu/YjQ4nApUxraAixmJ05o9fFib8kJpIgBk8549G5wwRxdGkHMcWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UgemrjOaWZ2A85yJM6JRsBPML8uCzY9gPVtlKFZpxk4=;
	b=nieqG0v+PEo+4wwpMZ695u5F4UzwOoFnKKZU9jxQEqGcRuptrY6VHaWFVMV6hqe36lb4
	 wzmfZu0eop03MFimrtzOQPec3TW8qnelNrt9WskZ+d6zbH/JegMUw4Bw8iq1J6S9fc4CU
	 xNBhh+gDWzcSK/i04Rkal9xdarAFcQHJx9OwlyM5x8YyjgdwrtPnHI+mG1Nl78x6gn0gJ
	 ZL14gZ/J+GoS/UlLe8cfPTb2VuKlh1pQPrgnXu+DZAKeITvLLTXOMdTPYc3pvykJY9Hnk
	 dy40GxTH+XicdC5AkJflrr1ELjih/7hqhqGq2GxbWBNks5WdwG4opvRJb2e+7Gb9wOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DUIy/W1/";
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F63606A324
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 19:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22F63606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUIy/W1/
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-843c8bbfbc4so1444821a34.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794425918; x=1795030718; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgemrjOaWZ2A85yJM6JRsBPML8uCzY9gPVtlKFZpxk4=;
        b=DUIy/W1/91nV5GlEpMwi5Aanc7cjWQF8A6AnC7m/FIp4kCcDhfGlzkLZBrDdEPFbal
         9oMFua/4fdZ32qohtsUSNfZJemjH2Gz0HoQRxUFWyKvshkWqXaU+i6sE/7LU/FHmlAhg
         vVqfgM+cuP6/KKSACLvukX3RjpncCkzgTGksZQxFZ5FopdvRze//E8ouuJC7bpmAFzPR
         zqmPzMWFcZywRI9HzBVfSCm3UCF4dw7BSUoPqQWTTSgLHOVkztqcQiW1aYeojs/SPq3a
         3Inzam5dJ2Qgv3W+RoysX7IiRwOdKwGnyAFapNQMsOaYiE7o1GkftKILDFJudZ/vvcPd
         eBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425918; x=1795030718;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgemrjOaWZ2A85yJM6JRsBPML8uCzY9gPVtlKFZpxk4=;
        b=nj7/hFkJ4yXQkJD9eYLpQJEEBJESNjZh2an3EsPDNLWFIIi26P3Ha1ekyIIXq1uR7F
         nEKJEpBQ3LYNtRvMNGf6ozzoyffAsDDMf3VQ8CA1/xhvpjTDA+6q75l4FsRJP6R4HmWO
         /cbqC9YigY6qjj/34w2FfuU5Oh3Qw3xFH2A3dhdB7pPmr6RAc9SS/M/wxAdqLe7qaec8
         36FTIaSG8wNyDa6X7vveW4/LE06Wbrcv+7hWLktpuGvu1fz0Ud+cMEoi8IoRA/soN/Op
         1KYM0Ssr9OVlhVUbFCJ1CMDHM4FmidCpN6scKmG61Q3Mp1cwV9Jdj1F+8WOXvFkj+7zd
         2xLw==
X-Gm-Message-State: APuU4Z+O6RzMSdh+PSwtzVhN/8vxfFpMhcxLGC5uWwhh4IhCmB/aLCwC
	CMeNauIOBSKei8WCcfLtpsCJ7YPf9F+I2tE70w4Q1LrmGyNDgROtRO3AFQjA12vlX40=
X-Gm-Gg: AYBFou3wKGkjjTXEApLNwydfofqiq/uXXh6FH6dyX4sB0mJ9gV3FZSyFlRCikcQB9J0
	1eIz061b3AKpzcAFfpTs6shewrf9OpH/jpsUfQEoxjQ9kxyDWt1+m4oRIFUxFnqj92y0kE5Nhti
	WNE7K5JyPusiKTbfrMxBctGkAW5ugccWLRn4gjrFhgiaHSZmbfJxXcU0qzYyHiIojkwI8NK6uZo
	MxpvoVbG5BASuDLvhPgKcNh35Czp3/CnG1cL1GN7tlzVkmXfKi5viQvTBijgXwxAYGgW8o1AONl
	OXM4h3A8McUvUeyNqrJwkeYUfthcGaQ7VyQeDj6LbJNqsvS+RK1wylDyVJ4Jg7O446nTyNFzoSn
	XlmxjVib4SbztU0u6+VvnRjI08FdvKo4HQXPbb8gi1g3FLdLjAhHYgaml3629zp156cd/ii/Kvk
	W3YzP25+54hgYq+38ytxdba1PRWmT96jgdXK1eZYbhmNey6Pi8W3lYEYb/sVdHJN/ZlJsyCHr3Z
	dFE0hUZVIM26l1XkdHSkQaA1fSTE2FxrsEOvOtTAXDBPTSUvGf/laeAdlsJqf35Ccu0cU66kdDa
	3BGZx2lybRQB5ELm/yqW67gVENW8qpWZQBh5xyzi4LFaxb8yJLB7HUv58NBwI5SkHpW5QBG1UR+
	m7ZFbtLVyvOgVmg9ub9s=
X-Received: by 2002:a05:6830:640d:b0:85d:502e:a26a with SMTP id 46e09a7af769-860f2848713mr3424226a34.14.1794425917990;
        Wed, 11 Nov 2026 11:38:37 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7b4sm5098512a34.4.2026.11.11.11.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:38:37 -0800 (PST)
Message-ID: <8e18dc61-4d6c-4da7-bd06-d547afc5c545@gmail.com>
Date: Wed, 11 Nov 2026 13:38:36 -0600
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: mediatek: mt8173-amazon-suez: Enable the
 volume keys
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-4-77b47cdea702@gmail.com>
 <sashiko-outbox-209564@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-209564@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/11/26 1:31 PM, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Does enabling &keyboard cause make dtbs_check to fail on
> mt8173-amazon-suez.dtb?
>
> In arch/arm64/boot/dts/mediatek/mt8173.dtsi, keyboard@10010000 uses
> compatible = "mediatek,mt8173-keypad", "mediatek,mt6779-keypad", but
> Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml does not
> list mediatek,mt8173-keypad in its compatible enum.

Same issue as [1]. The binding has been applied to input, but since the 
mailing list patch doesn't apply to v7.4-rc2 cleanly, I didn't add it as 
a prerequisite.

[1] 
https://lore.kernel.org/all/b005af5b-96a3-47da-b53d-5dd034b6d56b@gmail.com/

Best Regards,
Ryan Brue
