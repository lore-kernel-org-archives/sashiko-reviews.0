Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.21.61.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197212;
	b=3qzqbrgUSrh30FUjtsB7mIJ1JxDcIx6RmN4kU5TfAqe/YkiGhMzo7aL64DPKY7kFaNW1
	 IfPCeiw7H1xHgZY3kWenMxXU3947UgCmu9Oq7BEgSKQEwVC969autv/czyhTrE39agt4Y
	 fAi9PurTGQgh0OJ0P2+0if0NPYpP82msyN4NqsyRJc3jDKHig8I6NfxjHI0r/QXqFpF4q
	 54CtZIPWXnMDbW73joQh/I1eDGdwL/uwrMupMcd2+siG5kmanVZVFXwbWrFayih+fPZVe
	 7I4oGy3g2RDKNlUc2djkuVB4bXhZifSmrpI3dXuaivD68wVKH9fuqnWrN4VekhOZyBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197212;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kjTn6xldicO6RCtt89/zeFZNDZh8oCX8apMB4+cXgjk=;
	b=wAGBb+TPv/TFM+/SC2LWorcbyC3UdQkHtltrRaL6zrttgdVlXm/1LZDXCRy+lnUbZbDg
	 XnNnSN+kEcie61Z/VR1LvGiPfL7yFMuqttPA6Fijr/Su2vi929tsl4P630eg6Ug/fiBUC
	 FqOmOgwPYy6adseSpiF8Ro4VLlRQYVnI8rpUO4D2Nnetd38M22bwj0/s4Uno48R/G8ju9
	 Fve9mX3Igctquz3jthe3kiP0Qq4K5DLExmi/yc8F8WTUd1d7Y9ZNpEljRtI6jnnZo0jTX
	 yVdRhMZiJvDvfitK+4cs2muW6XIUHCJXyG0zD+4GRzZ8w5L1i8w+DWT6D7tfBYAKUAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aliel.fr;
	spf=pass smtp.mailfrom=aliel.fr;
	dkim=pass header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=vYBXbJye;
	arc=none smtp.remote-ip=65.21.61.41
Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F16C606A32A
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 17:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F16C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=vYBXbJye
Message-ID: <ef1b7465-9639-4d11-9b10-4b0c9da21bd5@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795197201;
	bh=V8tpS6gdtCA8ZbK1QEzTWT9dOlqALvACzeGN4IBIn60=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=vYBXbJyeFCDtVKTZkks5hS0kKXgmajx0a9aGeWOoL6LRhNYO0O1MO2QARIZQDEbki
	 ezb0rth3CwzPZpsK6kXyuX92iK0FDNFUbi2O3bjhrJgqn4rOtuRJaiEuf4sQG3B6Sm
	 eZmcENqezW7RZGDTK3ggXRmbK6y/wimX1gYVvpM8=
Date: Fri, 20 Nov 2026 18:52:50 +0100
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
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 07/10] drm/meson: dw-hdmi: Use the generic PHY framework
 for the HDMI TX PHY
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 vkoul@kernel.org, olteanv@gmail.com
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-7-9e0ac931381c@aliel.fr>
 <sashiko-outbox-219549@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-219549@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 21:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] drm/meson: dw-hdmi: suspend/resume order breaks PHY state and
>   HDMI output
> - [Medium] drm/meson: dw-hdmi: missing phy_exit() on dw_hdmi_probe()
>   failure
> - [Medium] drm/meson: dw-hdmi: premature PHY teardown in
>   meson_dw_hdmi_unbind()
> --
> 
> commit 91e31ad4e0b36171e791e7c0487c9a4c66b12b31
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY
> 
> This commit converts meson_dw_hdmi from direct HHI_HDMI_PHY_CNTL0..5
> register writes to the generic PHY API, with a legacy fallback when the
> device tree lacks a "phys" property.
> 
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 20a821936b3af..f28cc1e6ee1df 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> 
> 
> [Severity: Medium]
> Does meson_dw_hdmi_bind() leak a phy_init() reference if dw_hdmi_probe()
> fails later in this function (for example with -EPROBE_DEFER when the DDC
> I2C bus is not ready)?
> 
> When the PHY comes from the external PHY provider, devres cleanup on a
> failed component bind only calls phy_put(), leaving phy->init_count at 1.
> On the next bind attempt, meson_dw_hdmi_init() resets hdmitx_phy and calls
> phy_init(), which sees init_count > 0 and skips phy->ops->init(), leaving
> HHI_HDMI_PHY_CNTL0 and HHI_HDMI_PHY_CNTL1 uninitialized after the hardware
> reset.
> 

I will move revert this change.

> [Severity: Medium]
> Can tearing down meson_dw_hdmi->phy before devm_free_irq() and
> dw_hdmi_unbind() cause a use-after-free in dw_hdmi_top_thread_irq()?
> 
> CPU0                                    CPU1
> meson_dw_hdmi_unbind()
>   phy_exit(meson_dw_hdmi->phy)
>   devm_phy_destroy(..., meson_dw_hdmi->phy)
>                                         dw_hdmi_top_thread_irq()
>                                           dw_hdmi_setup_rx_sense()
>                                             ...
>                                               dw_hdmi_phy_init()
>                                                 phy_configure(dw_hdmi->phy, ...)
>                                                   <-- use-after-free
>   devm_free_irq(...)
>   dw_hdmi_unbind(...)
> 
> In the legacy PHY path, devm_phy_destroy() immediately unregisters and
> frees meson_dw_hdmi->phy while the threaded HPD interrupt handler is still
> active and can invoke dw_hdmi_phy_init() or dw_hdmi_phy_disable().  Even
> with a DT PHY, HPD handling or dw_hdmi_unbind() can access the PHY after
> phy_exit().  Should phy_exit() and devm_phy_destroy() run after
> devm_free_irq() and dw_hdmi_unbind()?
> 

I will move the phy_destroy after unbind, phy_exit will be on
phy_disable only.

> [Severity: High]
> Does calling phy_exit() in meson_dw_hdmi_pm_suspend() and phy_init() in
> meson_dw_hdmi_pm_resume() break HDMI output across system suspend/resume?
> 
> Because the HDMI TX platform device sits after the VPU master device on
> dpm_list (both from DT node order and because devm_phy_optional_get() adds
> a stateless device link to the PHY that reorders the consumer to the tail
> of dpm_list), system suspend runs meson_dw_hdmi_pm_suspend() before
> meson_drv_pm_suspend(), and system resume runs meson_drv_pm_resume()
> before meson_dw_hdmi_pm_resume().
> 
> On suspend, meson_dw_hdmi_pm_suspend() calls phy_exit() while the PHY is
> still powered on, before meson_drv_pm_suspend() ->
> drm_mode_config_helper_suspend() -> dw_hdmi_phy_disable() calls
> phy_power_off().
> 
> On resume, meson_drv_pm_resume() -> drm_mode_config_helper_resume() ->
> dw_hdmi_phy_init() calls phy_configure() and phy_power_on() while
> phy->init_count is still 0.  Then meson_dw_hdmi_pm_resume() runs
> meson_dw_hdmi_init(), which resets hdmitx_phy and calls phy_init(); since
> phy->power_count > phy->init_count, phy_init() warns ("phy_power_on was
> called before phy_init") and runs meson_hdmi_phy_init(), overwriting
> HHI_HDMI_PHY_CNTL0 and HHI_HDMI_PHY_CNTL1 with cntl0_init and cntl1_init
> and clobbering the mode that meson_drv_pm_resume() just configured and
> powered on.
> 

I will put phy_init in dw_hdmi_phy_init and phy_exit in
dw_hdmi_phy_disable for v2.

-- 
Best regards,
Ronald
