Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A66050EC1E
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747356; cv=none; b=F0HIwbEOQ4O0w6tFnuGusSJ1ZO1V1hQPPVOcR4siMZpua/VVTEagJw6Nokm5uurAhPGJFfyZr4mGwpaXWnfuqtMW5HN3vJqClPZJlaabPgvrufzdN86mo0nElQZH2eZIpA+ebgnJaNrzS56JI0TrVIkEzgLI6VXDS1uk0nCNdVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747356; c=relaxed/simple;
	bh=xLP8ZqqCxQPMvm6zHvf1Ffu9vtw7liSp3jcXxbjvmYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZHv1QLJ8Rq3qm2z0fGH4gVVTA6/o0olDBKRIVoiSJ1MZ8TGRl0605BrKnurUkoKa6fDe8lo350RQGd2wObQFwLIdNy3ZdP/aJ2oF3FUqajRcdwXn66EVnHkZ6jwY76471fienqEXSm40D9jCF88dYMdqNMWpe7QiGdY5mBf+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=nuIuPwDo; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="nuIuPwDo"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ca5aa8so86873185a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789747354; x=1790352154; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6GtIbzjgakznD0y35eQfGVe5BRX2BKpmAlzkE/AHnw=;
        b=nuIuPwDoEnHcwxcrhrf6HrJBRzhmdpQliAqpXoKr6IMrxJ2HEvZVdzGitxcWzG2JGf
         rAqg3RGxG9eeQys3IAsqJQHbA1ozo7XhV0KHdA9eZiVNGzajPUbvHVBcCC+6ZQqBYG8T
         mKsxv7pvlTEQ5oJ9wtdRQXuPpWt+pMcGZtyiZuQWz8H5WrwACTOn3nNySZTFQOAln8a3
         lu5PnA1EPi8D9hW5I5Lt2lMM9VQ3qC7GKvsdmiLqju/cbAl7OYtWS8TpZ5WgNmGWlCsV
         pfULqckPUmSK11gGJuyOZjA2IYIQh/IE7ibbRmlG0NMROBpudIpK+mksulYQf65Fg2c+
         z9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747354; x=1790352154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6GtIbzjgakznD0y35eQfGVe5BRX2BKpmAlzkE/AHnw=;
        b=ZBYuzqYQX0UvLK3xR+upb+RCNDiIaajxqnyNtYNCnmTxOovFTwB+UBzbUweoPD8rrw
         FiPpxj6QoQOs7VUKny4AoVMYJ7HveOvVDeOAWwiqbzr56UlxSVc/OJMfxsnO4PraQWTe
         FdVQw06Xc0zjKwrFerLHUV1O303LhK4nKpwhos146mEvGT1GoMdrrv9DaiEBmufWFGEV
         jhSFZKnX5EdJzO3ikPTN1hu0UJFYEtCjauf2z8mKuJq8bPbOdcosWfAnwG7ccpC9paf8
         TNtRcKEX257PsCNw9PTG+x8p2Q6xYcPYtLisLzErglFF3+Gz6tGz/P91t+WYpivt/i3j
         R+xQ==
X-Gm-Message-State: AFuF++m1EkvAmd/KFLQusJeaBzsDBLOFXw6GoTsad2bDlbo0aMVUcYyi
	Wvgt4p+KbHQTfC6guzGqzW538BlP4MnisdIaKNDFBxgPEMS/FXFpaX1av27wK+mTvjtn3L5UFvc
	I7rcg28M=
X-Gm-Gg: AYBFou1Ch3Gk28GBZSNicYDk4bgjvKeYFTLCtK2GZBYMtYbNfY7mNXTrP7+qU4HyVpL
	lqXbZ3xElFTLgpUnFL3uBuLpB6CK4LDct3b2BZuqeV+Aw7q2O1lCf3RLmq97VOOjH5PyEDutEYf
	nPXs+Vt4kjMBtEPbHUJ3RiKlMyDafFbJJcfzghcrZiA+AuIAyWoMi/vXRqAO1vw7eCnIR5e2t8i
	5Z7v8MIp3QqpmCmCovDR412xJD8eTk6S/qlKfUGWI4ieBtNcPdNRGbLQzjSY+w+WG9SFi2XHXkf
	TepO55XFRz4njsSLtHaZWfshi37uS5N6iimMSQCMAt9eEOkdg8zBWGTtjh7uK6uUKeh1/h4QKc1
	I5Ny+TR9R4kUnex5+lPkfMDaxKlUi7JMNB5/ii6irkwJCSmyvBHqU4i8pOa+U0ATe0rOboGI5eC
	hc9T10dLD0PoCfk5rzNz3ludCfzM/50uJxV1b2FdwxI+cgSc2TXkLu0khsLDI+TLOTOZ43Ti8=
X-Received: by 2002:a05:620a:3710:b0:93b:d79b:9a5b with SMTP id af79cd13be357-93bdca7992dmr437096285a.60.1789747353937;
        Fri, 18 Sep 2026 09:02:33 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e9ead7sm169853585a.23.2026.09.18.09.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 09:02:33 -0700 (PDT)
Message-ID: <36595da1-5943-4557-976f-4df709492045@riscstar.com>
Date: Fri, 18 Sep 2026 11:02:32 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint
 buses
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-pci@vger.kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
References: <20260918152659.413268-1-elder@riscstar.com>
 <20260918152659.413268-4-elder@riscstar.com>
 <20260918153925.E51901F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260918153925.E51901F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 10:39 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] pci: MMIO translation failure due to static dummy ranges bypassing dynamic update

The same Sashiko report was made in version 2 of this series.
  
https://lore.kernel.org/sashiko-reviews/ed783639-05ed-4ad9-b881-d1689a8b2418@riscstar.com/

(I repeat and reword my explanation below.)

If I knew how to make Sashiko take into account the prerequisite
series I would gladly do so:
   https://lore.kernel.org/lkml/20260910021919.3421449-1-elder@riscstar.com/


> --
> 
> commit 07e53b54e0b29671e1a08f764661a81fe5484062
> Author: Alex Elder <elder@riscstar.com>
> 
> arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses
> 
> This commit adds devicetree nodes for a PCIe endpoint and its peripheral
> buses on the QCS6490 RB3gen2 platform. It also defines static ranges for
> the endpoint BARs, with the expectation that these will be updated
> dynamically.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 3bb5fca8e2b13..5b7f5292a8864 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -955,11 +955,41 @@ pcie@3,0 {
>>   			bus-range = <0x5 0xff>;
>>   
>>   			dev@0,0 {
>> +				compatible = "pci1179,0220";
>>   				reg = <0x50000 0x0 0x0 0x0 0x0>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				/* Ranges will be updated dynamically */
>> +				ranges = <0x0 0x0 0x0  0x83050000 0x0 0x0  0x0 0x4000>,
> 
> [Severity: High]
> Does defining these dummy ranges statically bypass the dynamic update?
> 
> During PCI enumeration, pci_set_of_node() binds existing nodes like dev@0,0
> to the corresponding pci_dev. Later, when the PCI quirk calls
> of_pci_make_dev_node() to dynamically update the ranges,
> of_pci_make_dev_node() checks if (pci_device_to_OF_node(pdev)) and returns
> immediately without calling of_pci_add_properties().

The series mentioned above changes this code so that, rather
than returning immediately in this exact case, it updates the
ranges property to incorporate the BAR addresses assigned
during PCI enumeration.

> As a result, the dummy ranges are left intact, which causes child devices
> on the PCI endpoint bus to use these static ranges instead of the actual
> BAR addresses assigned by the PCI core. Will this lead to invalid memory
> accesses or driver probe failures?

And with the above series in place, the ranges are *not* left intact.

					-Alex

>> +					 <0x2 0x0 0x0  0x83050000 0x0 0x4000  0x0 0x80000>,
>> +					 <0x4 0x0 0x0  0x83050000 0x0 0x84000  0x0 0x200000>;
>> +
>> +				pci-ep-bus@4 {
>> +					compatible = "simple-bus";
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					/* Map 0x0-0x1fffff to BAR 4 */
>> +					ranges = <0x0  0x4 0x0 0x0  0x200000>;
>> +				};
>>   			};
>>   
>>   			dev@0,1 {
>> +				compatible = "pci1179,0220";
>>   				reg = <0x50100 0x0 0x0 0x0 0x0>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				/* Ranges will be updated dynamically */
>> +				ranges = <0x0 0x0 0x0  0x83050100 0x0 0x0  0x0 0x4000>,
> 
> [Severity: High]
> This appears to have the same issue. Because the dev@0,1 node is already
> present, the dynamic update logic in of_pci_make_dev_node() will bypass it.
> 
> Child devices under this node will then attempt to translate MMIO addresses
> using these static dummy ranges instead of the actual BAR addresses assigned
> by the PCI core.
> 

